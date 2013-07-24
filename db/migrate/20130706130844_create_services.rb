class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :supplier_id
      t.integer :category_id
      t.string :name
      t.string :description
      t.integer :pricing1
      t.integer :pricing2
      t.integer :pricing3
      t.integer :pricing_type_id

      t.timestamps
    end
  end
end
