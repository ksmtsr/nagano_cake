class OrderDetail < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :item

end
