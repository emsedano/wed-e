class AddCatStyle < ActiveRecord::Migration
  def change
  	change_table(:categories) do |t|
      ## Database authenticatable      
      t.string :color
      t.string :image
      
    end
  end


end
