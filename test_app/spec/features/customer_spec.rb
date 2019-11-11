require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature "Customers", type: :feature, js: true do
   
  let(:new_customer_form) { NewCustomerForm.new }

  it 'Visit index page' do
    visit(customers_path)
    expect(page).to have_current_path(customers_path)
  end
  
  it 'Creates a Customer - Page Object Pattern' do
    new_customer_form.visit_page.fill_in_with.submit
    expect(page).to have_content('Customer was successfully created.')
  end

  it 'Creates a Customer' do

    visit(new_customer_path)

    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)
    
    click_button('Create Customer')
    
    expect(page).to have_content('Customer was successfully created.')
  end
end