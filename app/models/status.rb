class Status < ApplicationRecord
  has_many :tokis, dependent: :destroy

  validates_numericality_of :status_order,  greater_than_or_equal_to: 1
  validates_uniqueness_of :status, :status_order
end
