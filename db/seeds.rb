require 'csv'

product_table = CSV.table(Rails.root.join("db/seed_mini4wd.csv"))

Product.transaction {
  product_table.each { |row|
    Product.create!(
      tamiya_id: row[:tamiya_id],
      category: row[:category],
      name: row[:name],
      keyword: row[:keyword],
      price: row[:price],
      description: row[:description],
      zero_chassis_flag: row[:zero_chassis_flag],
      type5_chassis_flag: row[:type5_chassis_flag],
      s1_chassis_flag: row[:s1_chassis_flag],
      s2_chassis_flag: row[:s2_chassis_flag],
      sfm_chassis_flag: row[:sfm_chassis_flag],
      stz_chassis_flag: row[:stz_chassis_flag],
      sx_chassis_flag: row[:sx_chassis_flag],
      sxx_chassis_flag: row[:sxx_chassis_flag],
      vs_chassis_flag: row[:vs_chassis_flag],
      stzx_chassis_flag: row[:stzx_chassis_flag],
      ar_chassis_flag: row[:ar_chassis_flag],
      ms_chassis_flag: row[:ms_chassis_flag],
      ma_chassis_flag: row[:ma_chassis_flag],
      fma_chassis_flag: row[:fma_chassis_flag]
    )
  }
}
