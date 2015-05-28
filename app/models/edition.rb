class Edition < ActiveRecord::Base

  belongs_to :magazine

  validates :date, presence: true
  validates :issue, presence: true
  validates :magazine_id, presence: true
  validates :edition, presence: true

  def full_edition
    "Edition #{self.edition}, Issue #{self.issue}: Published #{self.date.strftime("%m-%d-%Y")}"
  end
end
