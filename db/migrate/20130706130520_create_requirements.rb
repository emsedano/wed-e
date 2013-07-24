class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :weddy_id
      t.integer :category_id
      t.integer :low_budget
      t.integer :high_budget

      t.timestamps
    end
  end
end
