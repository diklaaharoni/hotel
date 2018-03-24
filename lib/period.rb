require 'pry'
module Hotel
  class Period

    attr_reader :check_in, :check_out

    def initialize(check_in, check_out)
      @check_in = check_in
      @check_out = check_out
    end

    def is_valid?
      (@check_out != nil && @check_in != nil) && !(@check_out <= @check_in) 
   end

    def num_of_nights
      return check_out - check_in
    end

    def include?(date)
      return date >= check_in && date < check_out
    end

  end
end
