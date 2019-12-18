class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                  null: false, index: true
      t.references :user,                  null: false, foreign_key: true
      t.string     :size                   null: true
      t.integer    :item_status,           null: false
      t.integer    :shipping_fee_defrayer, null: false
      t.integer    :shipping_system        null: true
      t.integer    :ship_from_prefecture,  null: false
      t.integer    :ship_date,             null: false
      t.integer    :price,                 null: false
      t.string     :description,           null: false
      t.integer    :buyer_id               null: true
      t.integer    :status,                null: false
      t.timestamps
    end
  end
end
