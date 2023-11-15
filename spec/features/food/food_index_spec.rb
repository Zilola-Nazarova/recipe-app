require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
  before(:each) do
    create_and_log_in_user
  end

  scenario 'User views the Food List page' do
    create_food_record('Apple', 'kg', 10.99)

    visit foods_path

    expect_page_content('Apple', 'kg', '10.99')

    expect(page).to have_button('Delete')
  end

  scenario 'User deletes a food record' do
    create_food_record('Apple', 'kg', 10.99)

    visit_and_delete_food_record

    expect(Food.count).to eq(0)
  end

  private

  def create_and_log_in_user
    User.delete_all
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm
    log_in_user('tom@example.com', 'topsecret')
  end

  def create_food_record(name, measurement_unit, price)
    Food.create(name: name, measurement_unit: measurement_unit, price: price, user: @user)
  end

  def visit_and_delete_food_record
    visit foods_path

    within 'table' do
      expect(page).to have_button('Delete', count: 1)
      click_button 'Delete'
    end
    sleep(2)
  end

  def log_in_user(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    sleep(1)
  end

  def expect_page_content(name, measurement_unit, price)
    expect(page).to have_link('Add Food', href: new_food_path)
    expect(page).to have_selector('table')

    within 'table' do
      expect(page).to have_selector('thead th', text: 'Name')
      expect(page).to have_selector('thead th', text: 'Measurement Unit')
      expect(page).to have_selector('thead th', text: 'Price')
      expect(page).to have_selector('thead th', text: 'Action')

      expect(page).to have_selector('tbody tr td', text: name)
      expect(page).to have_selector('tbody tr td', text: measurement_unit)
      expect(page).to have_selector('tbody tr td', text: price)
    end
  end
end
