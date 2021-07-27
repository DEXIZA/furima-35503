class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,  null: false
      t.text :description,  null: false
      t.text :description,  null: false

      t.timestamps
    end
  end
end
