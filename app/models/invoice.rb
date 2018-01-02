class Invoice < ApplicationRecord
  validates :item, presence: true
  validates :price, :presence => true,
            :numericality => true
end
