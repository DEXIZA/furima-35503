class CreateShippingAddInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_add_infos do |t|

      t.timestamps
    end
  end
end
