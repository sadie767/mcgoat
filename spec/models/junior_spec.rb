describe Junior do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }

  it { should have_many :jawards }
end
