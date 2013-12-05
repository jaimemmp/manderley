class Adress < ActiveRecord::Base
    
    attr_accessor :zipcode

    validates_presence_of :street
    validates :street, length:{
        minimum: 0,
        maximum: 150,
        too_long: 'the street is too long. street should be a string between 0 and 150 chars',
        too_short: 'the street is too short. street should be a string between 0 and 150 chars'
    }
    validates_presence_of :number
    validates :number, numericality: { only_integer: true }
    validates_presence_of :zipcode

    def distance_to(adress)
        @zipcode.to_i - adress.zipcode.to_i
    end
end
