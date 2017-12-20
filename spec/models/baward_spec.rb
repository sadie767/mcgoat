require 'rails_helper'

describe Baward do
  it { should validate_presence_of :buck_id }

  it { should belong_to :buck }
end
