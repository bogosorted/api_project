class FormularyIdPresenceValidator < ActiveModel::Validator
    def validate(record)
    
        if(record.formulary_id)
            record.errors.add :formulary_id, "this formulary does not exist" if Formulary.find_by_id(record.formulary_id).nil?
        end
    end
  end