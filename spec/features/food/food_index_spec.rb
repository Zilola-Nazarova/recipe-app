require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
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

  scenario 'User views the Food List page' do
    # Create some food records for the signed-in user
    Food.create(name: 'Apple', measurement_unit: 'kg', price: 10.99, user: @user)

    visit foods_path

    expect(page).to have_link('Add Food', href: new_food_path)

    expect(page).to have_selector('table')

    within 'table' do
      expect(page).to have_selector('thead th', text: 'Name')
      expect(page).to have_selector('thead th', text: 'Measurement Unit')
      expect(page).to have_selector('thead th', text: 'Price')
      expect(page).to have_selector('thead th', text: 'Action')

      expect(page).to have_selector('tbody tr td', text: 'Apple')
      expect(page).to have_selector('tbody tr td', text: 'kg')
      expect(page).to have_selector('tbody tr td', text: '10.99')

      expect(page).to have_button('Delete')
    end
  end

  scenario 'User deletes a food record' do
    # Create a food record for the signed-in user
    Food.create(name: 'Apple', measurement_unit: 'kg', price: 10.99, user: @user)

    visit foods_path

    within 'table' do
      expect(page).to have_button('Delete', count: 1)
      click_button 'Delete'
    end
    sleep(2)

    expect(Food.count).to eq(0)
  end
end
