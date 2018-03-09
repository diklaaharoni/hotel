require_relative 'spec_helper'
require 'pry'

describe 'Room class' do
  describe 'initialize' do
    it 'can create an instance of a room' do
      room = Hotel::Room.new(1)
      room.must_be_instance_of Hotel::Room
      room.room_num.must_equal 1
    end
  end

  describe 'mark_dates_as_reserved' do
    it 'should not mark the date as reserved' do
      room = Hotel::Room.new(1)
      period = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(period)
      period2 = Hotel::Period.new(Date.new(2018,03,02), Date.new(2018,03,04))
      room.is_available(period2).must_equal false
    end
    it 'it should mark the date as reserved' do
      room = Hotel::Room.new(1)
      period = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(period)
      period2 = Hotel::Period.new(Date.new(2018,03,03), Date.new(2018,03,05))
      room.is_available(period2).must_equal true
    end
  end

  describe 'is_reserved_for_date' do
    it 'raise an error if the date is nil' do
      room = Hotel::Room.new(1)
      date = nil
      proc {room.is_reserved_for_date(date)}.must_raise ArgumentError
    end
    it 'should return false if the date is include in the array' do
      room = Hotel::Room.new(1)
      period = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(period)
      date = Date.new(2018,02,02)
      room.is_reserved_for_date(date).must_equal false
    end
    it 'should return true if the date is include in the array' do
      room = Hotel::Room.new(1)
      period = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(period)
      date = Date.new(2018,03,02)
      room.is_reserved_for_date(date).must_equal true
    end
  end

  describe 'is_available' do
    it 'return true if the range of dates are available' do
      room = Hotel::Room.new(1)
      period = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(period)
      period2 = Hotel::Period.new(Date.new(2018,03,03), Date.new(2018,03,05))
      room.is_available(period2).must_equal true
    end
    it 'return false if the range of dates are not available' do
      room = Hotel::Room.new(1)
      period = Hotel::Period.new(Date.new(2018,03,01), Date.new(2018,03,03))
      room.mark_dates_as_reserved(period)
      period2 = Hotel::Period.new(Date.new(2018,03,02), Date.new(2018,03,05))
      room.is_available(period2).must_equal false
    end
  end
end
