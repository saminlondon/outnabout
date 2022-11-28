class Venue < ApplicationRecord
  has_many :activities

  belongs_to :use

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

end
