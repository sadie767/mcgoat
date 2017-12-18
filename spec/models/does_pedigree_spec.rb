require 'rails_helper'

describe DoesPedigree do
  it { should validate_presence_of :pedigree }
  it { should validate_presence_of :doe_id }

  it { should belong_to :doe }
end
