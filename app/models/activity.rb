class Activity < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name, :category]
  # CATEGORY = %w(bowling ping-pong darts go-karting rock-climbing trampolining mini-golf vr-gaming ice-skating escape-room)

  has_many :slots

  belongs_to :venue

  validates :name, presence: true
  validates :description, presence: true
  validates :operational_start_time, presence: true
  validates :activity_party_size, presence: true
  validates :price, presence: true
  validates :operational_end_time, presence: true

  has_one_attached :photo

  def slot_time
    "#{@activity.slots.start_time.strftime("%R")} - #{@activity.slots.end_time.strftime("%R")}"
  end
end
