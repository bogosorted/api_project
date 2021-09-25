require 'rails_helper'

RSpec.describe Question, type: :model do
    describe 'validate' do
        it 'uniqueness in same formulary' do

            formulary = Formulary.create(form_name: "About sky")
            question1 = Question.create(question_name: "why is it blue??",formulary_id: formulary.id)
            question2 = Question.create(question_name: "why is it blue??",formulary_id: formulary.id)
            
            expect(question2.errors[:question_name]).to include "has already been taken"

        end
        it 'plurality in different tests' do
            
            formulary1 = Formulary.create(form_name: "About the sky")
            question1 = Question.create(question_name: "why is it blue??",formulary_id: formulary1.id)
            formulary2 = Formulary.create(form_name: "About the sea")
            question2 = Question.create(question_name: "why is it blue??",formulary_id: formulary2.id)

            expect(question2).to be_valid
            
        end
    end
end