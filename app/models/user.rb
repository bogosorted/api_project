class User < ApplicationRecord
    #Email
    validates :email, uniqueness:{case_sensitive: false}

    #Cpf
    validates :cpf, uniqueness:{case_sensitive: false}, numericality: true
    validates_with CpfValidator
    
    #Password
    validates :password, length: { minimum: 6 }

end
