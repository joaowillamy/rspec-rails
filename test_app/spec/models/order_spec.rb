require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem um pedido' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end
end