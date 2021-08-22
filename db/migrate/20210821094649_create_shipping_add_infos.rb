class CreateShippingAddInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_add_infos do |t|
      t.string :postal_code,  null: false
      t.integer :prefecture_id,  null: false
      t.string :municipality,  null: false
      t.string :street_address,  null: false
      t.string :building_name
      t.string :street_address,  null: false
      t.references :purchase_record,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
