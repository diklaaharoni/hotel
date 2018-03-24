require_relative 'spec_helper'

describe 'Reservation class' do

  describe 'initialize' do
    it 'can be created' do
      room = Hotel::Room.new(1)
      check_in = Date.new(2018,03,01)
      check_out = Date.new(2018,03,03)
      dates = Hotel::Period.new(check_in, check_out)
      reservation = Hotel::Reservation.new(room, check_in, check_out)
      room.must_be_instance_of Hotel::Room
      dates.must_be_instance_of Hotel::Period
    end
    it 'can calculate the total cost' do
      reservation = Hotel::Reservation.new(Hotel::Room.new(1), Date.new(2018,03,01), Date.new(2018,03,03))
      room = Hotel::Room.new(1)
      dates = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(dates)
      price_per_night = room.price_per_night
      total_cost = dates.num_of_nights * price_per_night
      reservation.total_cost.must_equal 400
    end
    it 'raise an error if the date range is not availabe' do
      room = Hotel::Room.new(1)
      dates = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      reservation = Hotel::Reservation.new(room, Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(dates)
      proc{ Hotel::Reservation.new(room, Date.new(2018,03,01), Date.new(2018,03,02))}.must_raise ArgumentError

      # new_dates = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,02))
    end

    it 'raise an error if the date is in_valid' do
      room = Hotel::Room.new(1)
      dates = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,01))
      reservation = Hotel::Reservation.new(room, Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(dates)
      proc{ Hotel::Reservation.new(room, Date.new(2018,03,01), Date.new(2018,03,02))}.must_raise ArgumentError
    end
  end
end
