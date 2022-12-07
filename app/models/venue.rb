class Venue < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  include PgSearch::Model
  multisearchable against: [:name]
  has_many :activities, dependent: :destroy
  has_many :slots, through: :activities, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  has_one_attached :photo


end
