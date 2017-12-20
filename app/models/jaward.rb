class Jaward < ActiveRecord::Base
  validates :junior_id, :presence => true

  belongs_to :junior
end
