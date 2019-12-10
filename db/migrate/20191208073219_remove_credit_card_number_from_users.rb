class RemoveCreditCardNumberFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :credit_card_number, :string
  end
end
