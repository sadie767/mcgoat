class BucksAward < ActiveRecord::Base
  validates :award, :presence => true
  validates :buck_id, :presence => true

  belongs_to :buck
end
