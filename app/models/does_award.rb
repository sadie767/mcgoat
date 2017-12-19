class DoesAward < ActiveRecord::Base
  validates :doe_id, :presence => true

  belongs_to :doe
end
