class AddRoleToUsers < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
      ## Database authenticatable
      t.string :role, :null => false, :default => ""
      
    end
  end
end
