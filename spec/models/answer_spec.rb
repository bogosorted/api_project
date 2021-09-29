require 'rails_helper'

RSpec.describe Answer, type: :model do
    describe 'validate' do
        describe 'question_id' do
            it 'presence' do

                formulary = Formulary.create(form_name:"Hello World!")
                answer = Answer.create(content: "that's not ok!",formulary_id: formulary.id)

            
                expect(answer.errors[:question]).to include "must exist"

            end
        end
        describe 'formulary_id' do
            it 'presence' do
                
                question = Question.create(question_name: "that's not ok!")
                answer = Answer.create(content: "that's not true!", question_id: question.id)

                expect(answer.errors[:formulary]).to include "must exist"
            end
        end
    end
end