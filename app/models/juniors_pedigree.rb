class JuniorsPedigree < ActiveRecord::Base
  validates :pedigree, :presence => true
  validates :junior_id, :presence => true

  belongs_to :junior
end
