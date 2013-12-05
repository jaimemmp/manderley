require 'spec_helper'

describe Adress do

  before(:each) do
    @adress = build(:adress)
  end

  it 'should be a valid adress' do
    @adress.should be_valid
  end

  it 'should have a valid street' do
    @adress.should have(0).errors_on(:street)
  end

  it 'should have a nil street' do
    @adress.street = nil
    @adress.should have(2).errors_on(:street)
  end

  it 'should have a unvalid street with 0 chars' do
    @adress.street = ''
    @adress.should have(1).errors_on(:street)
  end

  it 'should have a unvalid street with 155 chars' do
    @adress.street = 'a'*155
    @adress.should have(1).errors_on(:street)
  end

  it 'should have a number' do
    @adress.should have(0).errors_on(:number)
  end

  it 'should have a string number' do
    @adress.number = 'five'
    @adress.should have(1).errors_on(:number)
  end

  it 'should have a nil number' do
    @adress.number = nil
    @adress.should have(2).errors_on(:number)
  end

  it 'should have a nil zipcode' do
    @adress.zipcode = nil
    @adress.should have(1).errors_on(:zipcode)
  end

  it 'returns the distance between 2 adresses' do
    @adress.zipcode = "28053"
    adress2 = build(:adress)
    adress2.zipcode = "28050"
    expect(@adress.distance_to(adress2)).to eq(3)
  end

  
end
