class Invoice < ApplicationRecord
  validates :customer_id, presence: true
  validates :merchant_id, presence: true

  has_many :transactions
  belongs_to :customer
  belongs_to :merchant
end
