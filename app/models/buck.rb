class Buck < ActiveRecord::Base
  # validates :image, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true

  has_many :bawards
end
