class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references   :purchase,    null: false, foreign_key: true
      t.string       :postcode,    null: false
      t.integer      :region_id,   null: false
      t.string       :city,        null: false
      t.string       :area_number, null: false
      t.string       :building
      t.string       :tell,        null: false
      t.timestamps
    end
  end
end
