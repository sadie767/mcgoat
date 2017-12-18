class DoesAward < ActiveRecord::Base
  validates :award, :presence => true
  validates :doe_id, :presence => true

  belongs_to :doe
end
