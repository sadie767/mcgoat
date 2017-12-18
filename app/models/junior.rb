class Junior < ActiveRecord::Base
  validates :image, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true

  has_many :juniors_awards
  has_many :juniors_pedigrees
end
