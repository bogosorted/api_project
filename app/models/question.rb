class Question < ApplicationRecord
  
    has_many :answers
    belongs_to :formulary

    validates_uniqueness_of :question_name, scope: :formulary_id

end
