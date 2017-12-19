require 'rails_helper'

describe Buck do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }

  it { should have_many :bucks_awards }
end
