module Hotel
  class Reservation

    PRICE_PER_NIGHT = 200

    def initialize(room, check_in check_out, total_cost)
      @room = room
      @total_cost = (@check_out - @check_in) * PRICE_PER_NIGHT
      @dates = Hotle::Period(check_in, check_out)
    end


  end
end
