class AddPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :price, :string
  end
end
