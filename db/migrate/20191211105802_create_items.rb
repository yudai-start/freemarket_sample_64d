class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                  null: false, index: true
      t.references :user,                  null: false, foreign_key: true
      t.string     :size
      t.integer    :item_status_id,           null: false
      t.integer    :shipping_fee_defrayer_id, null: false
      t.integer    :shipping_system
      t.integer    :ship_from_prefecture,  null: false
      t.integer    :ship_date_id,             null: false
      t.integer    :price,                 null: false
      t.string     :description,           null: false
      t.integer    :buyer_id
      t.integer    :status,                null: false
      t.timestamps
    end
  end
end
