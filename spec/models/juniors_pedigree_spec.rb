require 'rails_helper'

describe JuniorsPedigree do
  it { should validate_presence_of :pedigree }
  it { should validate_presence_of :junior_id }

  it { should belong_to :junior }
end
