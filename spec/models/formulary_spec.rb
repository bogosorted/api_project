require 'rails_helper'

RSpec.describe Formulary, type: :model do
    describe 'validate' do
        it 'presence' do

            formulary = Formulary.create()

            expect(formulary.errors[:form_name]).to include "can't be blank"

        end
        it 'uniqueness' do
            
            formulary1 = Formulary.create(form_name: "Hello World!")
            formulary2 = Formulary.create(form_name: "Hello World!")

            expect(formulary2.errors[:form_name]).to include "has already been taken"
            
        end
    end
end