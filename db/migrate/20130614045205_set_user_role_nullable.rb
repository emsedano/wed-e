class SetUserRoleNullable < ActiveRecord::Migration
  def change
  	change_column(:users, :role, :string, :null => true)
  end
end
