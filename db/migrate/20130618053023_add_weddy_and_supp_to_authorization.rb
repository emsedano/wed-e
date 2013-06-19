class AddWeddyAndSuppToAuthorization < ActiveRecord::Migration
  def change
  	change_table(:authorizations) do |t|
      ## Database authenticatable      
      t.integer :weddy_id
      t.integer :supplier_id
      
    end
  end
end
