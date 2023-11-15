require 'rails_helper'

RSpec.feature 'Food List', type: :feature do
  before do
    user = User.create(name: 'Tom', email: 'tommy@example.com', password: 'topsecret')
    food = Food.new(
      name: "Apple",
      measurement_unit: "kg",
      price: 10.99,
      user: user
    )
  end

  scenario 'User views the Food List page' do
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
    visit foods_path

    within 'table' do
      expect(page).to have_button('Delete', count: 1)

      accept_confirm do
        click_button 'Delete'
      end
    end

    expect(Food.count).to eq(0)
  end
end
