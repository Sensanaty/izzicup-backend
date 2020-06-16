class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :part_number,  null: false
      t.string :owner,        default: ""
      t.datetime :date_added
      t.string :description,  null: false
      t.integer :available,   null: false
      t.integer :reserved,    default: 0
      t.integer :sold,        default: 0
      t.string :condition,    null: false
      t.integer :cost_min,    null: false
      t.integer :price_min,   null: false
      t.integer :order_min,   null: false
      t.integer :cost_med,    default: 0
      t.integer :price_med,   default: 0
      t.integer :order_med,   default: 0
      t.integer :cost_max,    default: 0
      t.integer :price_max,   default: 0
      t.integer :order_max,   default: 0
      t.string :lead_time,    default: ""
      t.string :quote_type,   default: ""
      t.text :tag,            null: false

      t.timestamps
    end
  end
end
