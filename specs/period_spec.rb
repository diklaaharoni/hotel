require_relative 'spec_helper'

describe 'Period class' do

  describe 'initialize' do
    it 'Can initialize check in and check out' do
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2017, 03, 03)
      period = Hotel::Period.new(check_in, check_out)
      period.check_in.must_equal check_in
      period.check_out.must_equal check_out
      period.must_be_instance_of Hotel::Period
    end

    it "is an instance of Date" do
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2017, 03, 03)
      check_in.must_be_kind_of Date
      check_out.must_be_kind_of Date
    end
  end

  describe 'num_of_nights' do
    it "accurately calculates the number of night" do
      check_in = Date.new(2018, 03, 16)
      check_out = Date.new(2018, 03, 19)
      period = Hotel::Period.new(check_in, check_out)
      period.num_of_nights.must_equal 3
    end
  end

  describe "is_valid?" do
    it 'cannot have negative number of days' do
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2018, 02, 25)
      proc {Hotel::Period.new(check_in, check_out).is_valid?}.must_raise ArgumentError
    end

    it 'cannot have 0 days' do
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2018, 03, 01)
      proc {Hotel::Period.new(check_in, check_out).is_valid?}.must_raise ArgumentError
    end
  end

  describe 'include?' do
    it "returns true if the date is between check_in and check_out" do
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2018, 03, 04)
      period = Hotel::Period.new(check_in, check_out)
      date = Date.new(2018, 03, 03)
      period.include?(date).must_equal true
    end

    it "returns false if the date is not between check_in and check_out" do
      check_in = Date.new(2018, 03, 01)
      check_out = Date.new(2018, 03, 04)
      period = Hotel::Period.new(check_in, check_out)
      date = Date.new(2018, 03, 05)
      period.include?(date).must_equal false
    end
  end
end
