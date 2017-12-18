class Doe < ActiveRecord::Base
  # validates :image, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true

  has_many :does_awards
  has_many :does_pedigrees
end
