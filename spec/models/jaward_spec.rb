require 'rails_helper'

describe Jaward do
  it { should validate_presence_of :junior_id }

  it { should belong_to :junior }
end
