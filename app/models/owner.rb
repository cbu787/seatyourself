class Owner < ApplicationRecord
  has_many :restaurants
  has_many :reservations, through: :restaurants
  has_many :customers, through: :restaurants
end
