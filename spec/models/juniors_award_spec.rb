require 'rails_helper'

describe JuniorsAward do
  it { should validate_presence_of :junior_id }

  it { should belong_to :junior }
end
