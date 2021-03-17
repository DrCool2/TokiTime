class Status < ApplicationRecord
  has_many :tokis, dependent: :destroy
end
