class AddPasswordToAdmins < ActiveRecord::Migration
  def change

	add_index :admins, :name, unique: true

	add_column :admins, :password_digest, :string	

  end
end
