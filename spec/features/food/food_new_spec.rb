require 'rails_helper'

RSpec.feature 'Add Food Details', type: :feature do
  before(:each) do
    User.delete_all
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm
    log_in_user('tom@example.com', 'topsecret')
  end

  scenario 'User adds food details' do
    visit new_food_path

    fill_in_food_form('Apple', 'kg', 10, 1)
    click_button 'Create Food'

    expect_page_content_after_food_creation('Apple', 'kg', 10, 1)
  end

  scenario 'User submits the form with invalid data' do
    visit new_food_path
    existing_food_count = Food.count
    click_button 'Create Food'

    expect(Food.count).to eq(existing_food_count)
    expect(page).to have_content('Add Food Details')
  end

  private

  def log_in_user(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    sleep(1)
  end

  def fill_in_food_form(name, measurement_unit, price, quantity)
    fill_in 'Name', with: name
    fill_in 'food_measurement_unit', with: measurement_unit
    fill_in 'Price', with: price
    fill_in 'Quantity', with: quantity
  end

  def expect_page_content_after_food_creation(name, measurement_unit, price, quantity)
    expect(page).to have_content('Food was successfully created')
    created_food = Food.last
    expect(created_food.name).to eq(name)
    expect(created_food.measurement_unit).to eq(measurement_unit)
    expect(created_food.price).to eq(price)
    expect(created_food.quantity).to eq(quantity)
  end
end
