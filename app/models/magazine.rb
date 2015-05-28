class Magazine < ActiveRecord::Base

  has_many :editions
  validates :title, presence: true



end
