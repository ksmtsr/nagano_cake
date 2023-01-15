class OrderDetail < ApplicationRecord

  enum order_detail: { cannot_started: 0, waiting_production: 1, making: 2, complete: 3 }


  belongs_to :order
  belongs_to :item

end
