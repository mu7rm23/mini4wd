class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :tamiya_id
      t.string :category
      t.string :name
      t.integer :price
      t.string :keyword
      t.boolean :zero_chassis_flag
      t.boolean :type5_chassis_flag
      t.boolean :s1_chassis_flag
      t.boolean :s2_chassis_flag
      t.boolean :sfm_chassis_flag
      t.boolean :stz_chassis_flag
      t.boolean :sx_chassis_flag
      t.boolean :sxx_chassis_flag
      t.boolean :vs_chassis_flag
      t.boolean :stzx_chassis_flag
      t.boolean :ar_chassis_flag
      t.boolean :ms_chassis_flag
      t.boolean :ma_chassis_flag
      t.boolean :fma_chassis_flag

      t.timestamps null: false
    end
  end
end
