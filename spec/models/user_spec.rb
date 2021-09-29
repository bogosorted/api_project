require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validate' do  
            describe 'email' do    
                it 'presence' do

                    user = User.create()

                    expect(user.errors[:email]).to include "can't be blank"

                end
                it 'uniqueness' do

                    user1 = User.create(email: "example@domain.com",cpf: 41600973086,password: "1234567")  
                    user2 = User.create(email: "ExAMplE@DoMAIN.CoM",cpf: 73513571020,password: "1234567")

                    expect(user2.errors[:email]).to include "has already been taken"
                end
            end
        describe 'cpf' do
            it "it's valid" do

                user = User.create(email: "example@domain.com",cpf: 123321123, password: "1234567")
                
                expect(user.errors[:cpf]).to include "cpf is not valid"
            end
            it 'uniqueness'do

                user1 = User.create(email: "example123@domain.com",cpf: 41600973086, password: "1234567")
                user2 = User.create(email: "example321@domain.com",cpf: 41600973086, password: "1234567")

                expect(user2.errors[:cpf]).to include "has already been taken"    
            end
        end
        describe 'password' do
            it 'has more than 6 digits' do

                user = User.create(email: "example123@domain.com",cpf: 41600973086, password: "123456")

                expect(user.errors[:password]).to include "is too short (minimum is 7 characters)"
                
            end
        end

    end
end