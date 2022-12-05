class Slot < ApplicationRecord
  belongs_to :activity

  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :available, -> { where(is_available: true) }

  def slot_time
    "#{self.start_time.strftime("%R")} - #{self.end_time.strftime("%R")}"
  end
end
