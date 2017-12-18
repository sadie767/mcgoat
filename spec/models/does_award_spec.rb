require 'rails_helper'

describe DoesAward do
  it { should validate_presence_of :award }
  it { should validate_presence_of :doe_id }

  it { should belong_to :doe }
end
