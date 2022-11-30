class Slot < ApplicationRecord
  belongs_to :activity

  validates :start_time, presence: true
  validates :end_time, presence: true


  def to_s
    "#{self.start_time} - #{self.end_time}"
  end
end
