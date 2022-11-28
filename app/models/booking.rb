class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validates :user_party_size, presence: true
end
