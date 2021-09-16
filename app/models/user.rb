class User < ApplicationRecord

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
                length: {minimum: 6}
    

end
