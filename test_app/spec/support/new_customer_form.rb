class NewCustomerForm
  include Capybara::DSL  # Capybara
  include FactoryBot::Syntax::Methods  # FactoryBot
  # include Warden::Test::Helpers  # Devise
  include Rails.application.routes.url_helpers  # Routes

  # def login
  #   member = create(:member)
  #   login_as(member, :scope => :member)
  #   self
  # end

  def visit_page
    visit(new_customer_path)
    self
  end

  def fill_in_with(params = {})
    page.save_screenshot('screenshot-new-customer-before.png')
    fill_in('Name', with: params.fetch(:name, Faker::Name.name))
    fill_in('Email', with: params.fetch(:email, Faker::Internet.email))
    fill_in('Address', with: params.fetch(:address, Faker::Address.street_address))
    page.save_screenshot('screenshot-new-customer-after.png')
    self
  end

  def submit
    click_button('Create Customer')
  end
end