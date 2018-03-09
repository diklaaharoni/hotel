module Hotel
  class Reservation

    attr_reader :room, :dates, :total_cost
    def initialize(room, check_in, check_out)
      @room = room
      @dates = Hotel::Period.new(check_in, check_out)
        if !@room.is_available(@dates)
          raise ArgumentError "This dates are not available"
        end
      @room.mark_dates_as_reserved(@dates)
      @total_cost = @dates.num_of_nights * @room.price_per_night
    end


  end
end
