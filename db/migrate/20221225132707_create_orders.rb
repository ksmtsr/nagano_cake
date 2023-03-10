class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer  :customer_id,            null: false
      t.integer  :payment_method,         null: false, default: 0
      t.integer  :amount,                 null: false
      t.integer  :postage,                null: false
      t.string   :postal_code,            null: false
      t.string   :address,                null: false
      t.string   :name,                   null: false
      t.integer  :status,                 null: false, default: 0

      t.timestamps
    end
  end
end
