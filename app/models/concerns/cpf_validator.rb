class CpfValidator < ActiveModel::Validator
    def validate(record)
    
    record.errors.add :cpf, "cpf is not valid" unless CPF.valid?(record.cpf)   

    end
  end