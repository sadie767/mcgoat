require 'rails_helper'

describe BucksAward do
  it { should validate_presence_of :award }
  it { should validate_presence_of :buck_id }

  it { should belong_to :buck }
end
