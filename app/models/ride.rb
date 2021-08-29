class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    before_save :take_ride

    def take_ride
        if self.user.tickets.nil? || self.user.height.nil?
            return "something is wrong"
        end
        tall_enough, enough_tickets = self.approved?
        if tall_enough && enough_tickets
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
        else 
            problems = ["Sorry."]
            if !enough_tickets
                problems << "You do not have enough tickets to ride the #{attraction.name}."
            end
            if !tall_enough
                problems << "You are not tall enough to ride the #{attraction.name}."
            end
            return problems.join(" ")
        end
    end

    def approved?
        tall_enough, enough_tickets = false, false
        if self.user.tickets >= self.attraction.tickets
            enough_tickets = true
        end
        if self.user.height >= self.attraction.min_height
            tall_enough = true
        end
        return [tall_enough, enough_tickets]
    end
end
