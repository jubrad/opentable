require 'rails_helper'

describe Restaurant do

  let(:restaurant) { Restaurant.new(
    name: 'valid',
    description: 'true',
    owner_id: 1,
    phone: '111-111-1111',
    weburl: 'http://test.com'
  )}

  it 'should validate presnese of name' do
    restaurant.name = nil
    expect(restaurant).not_to be_valid
    restaurant.name = 'valid'
    expect(restaurant).to be_valid
  end

  it 'should validate uniqueness of name' do
    restaurant.save
    expect(restaurant.save
  end

end
