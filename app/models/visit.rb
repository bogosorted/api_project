class Visit < ApplicationRecord

    enum status:[:pending,:doing,:done]
    
    validates :date, presence: true

    belongs_to :user
end
