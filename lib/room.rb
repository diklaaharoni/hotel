module Hotel
  class Room

    PRICE_PER_NIGHT = 200
    attr_reader :room_num, :price_per_night

    def initialize(num)
      @room_num = num
      @price_per_night = PRICE_PER_NIGHT
      @reserved_dates = []
    end



    def mark_dates_as_reserved(reservation_period)
      (reservation_period.check_in...reservation_period.check_out).each do |date|
        @reserved_dates << date
      end
    end

  	def is_reserved_for_date(date)
      if date != nil 
        @reserved_dates.include?(date)
      else
        raise ArgumentError.new("Invalid date")
      end
    end

    def is_available(query_period)
      (query_period.check_in...query_period.check_out).each do |date|
        if is_reserved_for_date(date)
          return false
        end
      end
      return true
    end
  end
end
