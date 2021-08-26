class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
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

        # Ride has a method 'take_ride' that accounts for the user not having enough tickets
        # Ride has a method 'take_ride' that accounts for the user not being tall enough
        # Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
        # Ride has a method 'take_ride' that updates ticket number
        # Ride has a method 'take_ride' that updates the user's nausea
        # Ride has a method 'take_ride' that updates the user's happiness
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
