class Restaurant < ApplicationRecord
  belongs_to :owner
  has_many :reservations
  has_many :customers, through: :reservations
  validates :name, :capacity, :address, :description, :phone_number, :open_time, :close_time, presence: true
  validates :capacity, numericality: {only_integer: true, greater_than: 0}
  validates :price, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :phone_number, numericality: {only_integer: true}, length: {is: 10}
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
