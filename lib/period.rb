module Hotel
  class Period

    attr_reader :num_of_night, :start_date, :end_date

    def initialize(check_in, check_out)
      @start_date = check_in
      @end_date = check_out
    end

    if @end_date != nil
      if @start_date > @end_date
        raise ArgumentError.new("Invalid date")
      end
    end

    def num_of_night

    end

    def include?

    end

  end
end
