class Visit < ApplicationRecord

    belongs_to :user

    enum status:[:pending,:doing,:done]   
    
    validates :date, presence: true


end
