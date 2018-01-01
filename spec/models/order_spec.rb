require 'rails_helper'

describe Order, 'validation' do
  it { should validate_presence_of :status }
  it { should validate_presence_of :total_price }
end

describe Order, 'association' do
  it { should have_many :order_items }
end

describe Order, 'column_specification' do
  it { should have_db_column(:status) }
  it { should have_db_column(:total_price) }
end
