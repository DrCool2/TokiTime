class Status < ApplicationRecord
  has_many :tokis, dependent: :destroy

  validates_numericality_of :status_order,  greater_than_or_equal_to: 1
  validates_uniqueness_of :status

  validate :proper_status_order

  def proper_status_order
    while Status.find_by_status_order(status_order).present?
      new_status_order = Status.find_by_status_order(status_order).status_order + 1
      Status.find_by_status_order(status_order).update(status_order: new_status_order)
    end
    return true
  end
end
