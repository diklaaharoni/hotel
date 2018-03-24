module Hotel
  class Reservation

    attr_reader :room, :dates, :total_cost
    def initialize(room, check_in, check_out)
      @room = room
      @dates = Hotel::Period.new(check_in, check_out)
        if !@dates.is_valid? || !@room.is_available(@dates)
          raise ArgumentError.new("This dates are not availabe")
        end
      @room.mark_dates_as_reserved(@dates)
      @total_cost = @dates.num_of_nights * @room.price_per_night
    end


  end
end
