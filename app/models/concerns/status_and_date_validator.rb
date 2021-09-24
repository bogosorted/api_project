class StatusAndDateValidator < ActiveModel::Validator
    
    Time.zone = 'America/Sao_Paulo'

    def validate(record)

        record.status = 'pending' if (!record.status)
        
        if(record.date) 
            record.errors.add :error, "put the visit date forward or in the same actual date and hour" if (record.date <= Time.now)
        end


        if(record.checkin_at)
            
            record.errors.add :error, "check in can not be in present or future" if (record.checkin_at >= Time.now)

            if(record.checkin_at.to_i >= record.checkout_at.to_i && record.checkout_at)

                record.errors.add :error, "checkin can not be in after check out and checkout can not be before checkin"
            else
                
                record.status = 'doing'

            end

            record.status = 'done' if (record.checkout_at)
                

        end

        record.errors.add :error, "checkout can not be added before one checkin" if (record.checkout_at && !record.checkin_at)

    end

end