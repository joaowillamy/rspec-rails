require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#full_name - overwrite' do
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

  it 'Heritage' do
    customer = create(:customer_default)
    expect(customer.vip).to be_falsey
    
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
  end

  it 'Transitional Attribute' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 23, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to be < Time.now
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
