class LovStatus < ApplicationRecord
  has_many :tokis, dependent: :destroy
end
