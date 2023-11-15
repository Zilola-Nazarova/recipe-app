require 'rails_helper'

RSpec.feature 'Add Food Details', type: :feature do
  before(:each) do
    User.delete_all
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm
    sleep(1)

    visit new_user_session_path
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'topsecret'
    click_button 'Log in'
    sleep(1)
  end

  scenario 'User adds food details' do
    visit new_food_path

    fill_in 'Name', with: 'Apple'
    fill_in 'food_measurement_unit', with: 'kg'
    fill_in 'Price', with: 10
    fill_in 'Quantity', with: 1
    click_button 'Create Food'
    expect(page).to have_content('Food was successfully created')
    created_food = Food.last
    expect(created_food.name).to eq('Apple')
    expect(created_food.measurement_unit).to eq('kg')
    expect(created_food.price).to eq(10)
    expect(created_food.quantity).to eq(1)
  end

  scenario 'User submits the form with invalid data' do
    visit new_food_path
    existing_food_count = Food.count
    click_button 'Create Food'

    expect(Food.count).to eq(existing_food_count)

    expect(page).to have_content('Add Food Details')
  end
end
