class Buck < ActiveRecord::Base
  validates :image, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true

  has_many :bucks_awards
  has_many :bucks_pedigrees
end
