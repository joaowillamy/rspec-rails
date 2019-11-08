require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#full_name - Sobrescrevendo Atributo' do
    customer = create(:user, name: "João Willamy" )
    customer1 = create(:customer, name: "João Willamy" )
    expect(customer.full_name).to eq("Sr. João Willamy")
    expect(customer1.full_name).to eq("Sr. João Willamy")
  end

  it '#full_name' do
    customer = create(:customer)
    expect(customer.name).to be_a(String)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it { expect { create(:customer) }.to change {Customer.all.size}.by(1) }

end
