require 'rails_helper'

describe BucksPedigree do
  it { should validate_presence_of :pedigree }
  it { should validate_presence_of :buck_id }

  it { should belong_to :buck }
end
