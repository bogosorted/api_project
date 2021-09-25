class Formulary < ApplicationRecord

    has_many :questions

    validates :form_name , 
                presence: true,
                uniqueness:{case_sensitive: false}


end
