class JuniorsAward < ActiveRecord::Base
  validates :award, :presence => true
  validates :junior_id, :presence => true

  belongs_to :junior
end
