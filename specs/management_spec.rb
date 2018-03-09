require_relative 'spec_helper'

describe 'Management class' do
  describe 'initialize' do
    it "can be created" do
      hotel_management = Hotel::Management.new
      hotel_management.must_be_instance_of Hotel::Management
      hotel_management.rooms.must_be_kind_of Array
      reservations = Hotel::Management.new
      reservations.must_be_instance_of Hotel::Management
    end
    it "can access the list of all of the rooms in the hotel" do
      hotel = Hotel::Management.new
      hotel.rooms.length.must_equal 20
    end

    it "there should be 20 total rooms" do
      hotel = Hotel::Management.new
      hotel.rooms.count.must_equal 20
    end
  end
  describe 'reserve_room' do
    it 'return reservation' do
      room = Hotel::Room.new(1)
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2018, 03, 03)
      reservation = Hotel::Management.new.reserve_room(room, check_in, check_out)
      reservation.dates.check_in.must_equal check_in
      reservation.dates.check_out.must_equal check_out
    end
  end

  describe 'get_reservations_for_date' do
    it 'return an array of reservations for date' do
      management = Hotel::Management.new
      room = Hotel::Room.new(1)
      date = Date.new(2018, 03, 02)
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2018, 03, 03)
      management.reserve_room(room, check_in, check_out)
      management.get_reservations_for_date(date).must_be_kind_of Array
      management.get_reservations_for_date(date).length.must_equal 1
    end
  end
end
