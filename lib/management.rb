module Hotel
  class Management

    # PRICE_PER_NIGHT = 200
    attr_reader :rooms, :price_per_night

    def initialize
      @rooms = []
      (1..20).each do |num|
        @rooms << Hotel::Room.new(num)
      end
      @reservations = []

    end

    def reserve_room(room, check_in, check_out)
      reservation = Hotel::Reservation.new(room, check_in, check_out)
      @reservations << reservation
      return reservation
    end

    def get_reservations_for_date(date)
      reservations_for_date = []
      @reservations.each do |reservation|
        if reservation.dates.include?(date) #check_in == date
          reservations_for_date << reservation
        end
      end
      return reservations_for_date
    end





  end # end of class
end # end of module
