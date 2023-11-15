require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
  before(:each) do
    User.delete_all
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm
    log_in_user('tom@example.com', 'topsecret')
  end

  scenario 'User views the Food List page' do
    Food.create(name: 'Apple', measurement_unit: 'kg', price: '10.99', user: @user)
    visit foods_path
    expect(page).to have_link('Add Food', href: new_food_path)
    expect(page).to have_selector('tbody tr td', text: 'Apple')
    expect(page).to have_selector('tbody tr td', text: 'kg')
    expect(page).to have_selector('tbody tr td', text: '10.99')
    expect(page).to have_button('Delete')
  end

  scenario 'User deletes a food record' do
    Food.create(name: 'Apple', measurement_unit: 'kg', price: '10.99', user: @user)
    visit foods_path
    expect(page).to have_button('Delete', count: 1)
    click_button 'Delete'
    expect(Food.count).to eq(0)
  end

  private

  def log_in_user(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    sleep(1)
  end
end
