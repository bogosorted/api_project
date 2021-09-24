class Visit < ApplicationRecord

    belongs_to :user

    enum status:[:pending,:doing,:done]
   
    validates :date, presence: { message: "date cannot be null" }
    validates :user_id, presence:{ message: "user_id cannot be null" }

    validates_with StatusAndDateValidator


end
