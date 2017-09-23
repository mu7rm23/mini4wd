class ChangeTamiyaIdToProducts < ActiveRecord::Migration
  def change
    change_column :products, :tamiya_id, :string
  end
end
