class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :budget
      t.integer :city_id
      t.string :description
      t.integer :guests
      t.string :name
      t.string :phone
      t.integer :state_id
      t.string :weburl
      t.datetime :weddate

      t.timestamps
    end
  end
end
