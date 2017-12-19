class BucksAward < ActiveRecord::Base
  validates :buck_id, :presence => true

  belongs_to :buck
end
