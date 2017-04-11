class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  validate :operating_hours
  validates :date, :time, :party_size, :restaurant_id, presence: true
  validates :party_size, numericality: {only_integer: true, greater_than: 0, less_than: 21}

  def operating_hours
    if (time < restaurant.open_time) || (time >= restaurant.close_time)
      errors.add(:not_open, "Restaurant closed.")
    end
  end

  def availability
    seats_taken = Reservation.all.where(date: date, time: time).(:party_size)

    if (restaurant.capacity - seats_taken) < party_size
      errors.add(:over_capacity, "Sorry, we cannot accommodate your party size.")
    end
  end
end
