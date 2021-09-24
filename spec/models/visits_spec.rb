   
require 'rails_helper'

RSpec.describe Visit, type: :model do

    describe 'validate' do

        
        describe 'date' do

            it 'presence' do

                visit = Visit.create()

                expect(visit.errors[:date]).to include "date cannot be null"
                
            end

            it 'must be after the current date' do

                visit = Visit.create(date:Time.now - 1.second)
    
                expect(visit.errors[:error]).to include "put the visit date forward or in the same actual date and hour"

            end
            
        end 

        describe 'checkin_at' do

            it 'must be less than the current date'do

                checkin_at = Time.now + 10.minutes

                visit = Visit.create(date:Time.now + 10.hour, checkin_at: checkin_at,user_id: 1)
                expect(visit.errors[:error]).to include "check in can not be in present or future"
            
            end

            it 'must be less than checkout' do

                checkin_at = Time.now - 10.minutes    
                checkout_at = Time.now - 15.minutes
                
                
                visit = Visit.create(date:Time.now + 10.hour, checkin_at: checkin_at,checkout_at: checkout_at)

                expect(visit.errors[:error]).to include "checkin can not be in after check out and checkout can not be before checkin"

            end

        end

        describe 'checkout_at'do

            it 'cannot be added before the checkin_at'do

                checkout_at = Time.now - 10.minutes

                visit = Visit.create(date:Time.now + 10.hour, checkout_at: checkout_at,user_id: 1)
                expect(visit.errors[:error]).to include "checkout can not be added before one checkin"
            
            end
        end

    end

end