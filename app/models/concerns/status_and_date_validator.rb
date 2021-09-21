class StatusAndDateValidator < ActiveModel::Validator
    Time.zone = 'America/Sao_Paulo'
    def validate(record)

        if(!record.status)
            record.status = 'pending'
        end

        if(record.date <= Time.now)
            record.errors.add :status, "put the visit date forward or in the same actual date and hour" 
        end

        if(record.checkin_at)
            
            if(record.checkin_at >= Time.now)

                record.errors.add :status, "check in can not be in present or future"

            end

            if(record.checkin_at.to_i >= record.checkout_at.to_i && record.checkout_at)

                record.errors.add :status, "checkin can not be in after check out and checkout can not be before checkin"
            else
                
                record.status = 'doing'

            end

            if(record.checkout_at)

                record.status = 'done'
                
            end

        end

        if(record.checkout_at && !record.checkin_at)
            record.errors.add :status, "checkout can not be added before one checkin"
        end

    end

end