class CreatePricingTypes < ActiveRecord::Migration
  def change
    create_table :pricing_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
