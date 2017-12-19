describe Doe do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }

  it { should have_many :does_awards }
end
