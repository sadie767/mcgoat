describe Doe do
  it { should validate_presence_of :image }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }

  it { should have_many :does_awards }
  it { should have_many :does_pedigrees }
end
