class BucksPedigree < ActiveRecord::Base
  validates :pedigree, :presence => true
  validates :buck_id, :presence => true

  belongs_to :buck
end
