class Visit < ApplicationRecord

    belongs_to :user
    
    validates :date, presence: true
    enum status:[:pending,:doing,:done]   


    validates_with StatusAndDateValidator


end
