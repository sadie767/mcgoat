require 'rails_helper'

describe OrderItem, 'validation' do
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :product_id }
  it { should validate_presence_of :order_id }
end

describe OrderItem, 'association' do
  it { should belong_to :product }
  it { should belong_to :order }
end

describe OrderItem, 'column_specification' do
  it { should have_db_column(:quantity) }
  it { should have_db_column(:product_id) }
  it { should have_db_column(:order_id) }
end
