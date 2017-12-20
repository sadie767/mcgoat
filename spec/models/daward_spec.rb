require 'rails_helper'

describe Daward do
  it { should validate_presence_of :doe_id }

  it { should belong_to :doe }
end
