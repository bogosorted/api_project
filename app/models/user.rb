class User < ApplicationRecord
    
    #softdelet
    acts_as_paranoid

    has_many :visits
    #Email
    validates :email,
                presence: true,
                uniqueness:{case_sensitive: false}

    #Cpf
    validates :cpf,
                presence: true,
                uniqueness:{case_sensitive: false}, 
                numericality: true

    validates_with CpfValidator
    
    #Password
    has_secure_password

    validates :password,
                length: {minimum: 7}
    

end
