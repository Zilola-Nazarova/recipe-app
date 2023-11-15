require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'Tom', email: 'tommy@example.com', password: 'topsecret')
    food = Food.new(
      name: 'Apple',
      measurement_unit: 'kg',
      price: 10.99,
      user:
    )
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(measurement_unit: 'kg', price: 10.99)
    expect(food).not_to be_valid
  end

  it 'is not valid without a measurement unit' do
    food = Food.new(name: 'apple', price: 10.99)
    expect(food).not_to be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(name: 'apple', measurement_unit: 'kg')
    expect(food).not_to be_valid
  end
end
