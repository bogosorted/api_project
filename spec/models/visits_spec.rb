   
require 'rails_helper'

RSpec.describe Visit, type: :model do

    describe 'validate' do

        describe 'date' do

            let(:valid_user) {User.new(email:"example@domain.com",cpf: "03521225011", password: "123456")}

            it 'presence' do

                valid_user.save

                visit = Visit.new(user_id: valid_user.id)

                expect(visit).to_not be_valid
                
            end

            it 'should be after the current date' do

                valid_user.save

                visit = Visit.new(date:Time.now - 1.second ,user_id: valid_user.id)

                expect(visit).to_not be_valid

            end

            
        end 

    end

end