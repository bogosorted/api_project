class Answer < ApplicationRecord

  belongs_to :formulary
  belongs_to :question
  belongs_to :visit, optional: true

end
