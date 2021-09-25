class Question < ApplicationRecord
  
    has_many :answers

    belongs_to :formulary, optional: true

   validates_uniqueness_of :question_name, scope: :formulary_id

end
