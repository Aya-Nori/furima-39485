class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references   :puchase,     null: false, foreign_key: true
      t.string       :postcode,    null: false
      t.integer      :region_id,   null: false
      t.string       :cith,        null: false
      t.string       :area_number, null: false
      t.string       :building,    null: false
      t.string       :tell,        null: false
      t.timestamps
    end
  end
end
