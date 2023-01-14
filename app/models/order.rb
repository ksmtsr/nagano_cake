class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {　入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  belongs_to :customer
  belongs_to :order_detail
  has_many :addresses, dependent: :destroy

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

  def full_name
    self.last_name + self.first_name
  end

  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end


end
