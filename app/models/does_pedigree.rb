class DoesPedigree < ActiveRecord::Base
  validates :pedigree, :presence => true
  validates :doe_id, :presence => true

  belongs_to :doe
end
