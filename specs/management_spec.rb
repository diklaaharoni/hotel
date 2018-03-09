require_relative 'spec_helper'

describe 'Management class' do
  describe 'initialize' do
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
    it 'return array of all reservations' do

    end
  end

  describe 'get_reservations_for_date' do
    it '' do

    end
  end
end
