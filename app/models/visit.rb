class Visit < ApplicationRecord
    enum status: [:pending,:doing,:done]
    belongs_to :user
end
