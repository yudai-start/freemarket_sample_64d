class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :family_name,      null: false
      t.string     :first_name,       null: false
      t.string     :family_name_kana, null: false
      t.string     :first_name_kana,  null: false
      t.string     :post_code,        null: false
      t.integer    :prefecture_id,       null: false
      t.string     :city,             null: false
      t.string     :street_number,    null: false
      t.string     :building_name,    null: true
      t.string     :phone_number,     null: true
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end