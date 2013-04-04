class AddAttrsToEvents < ActiveRecord::Migration
  def change
	add_column :events, :age_restrict, :enum
	add_column :events, :label, :enum
	add_column :events, :website, :string
	add_column :events, :time, :time
	add_column :events, :date, :date
	add_column :events, :address, :string
	add_column :events, :description, :string
	add_column :events, :cost, :enum
	add_column :events, :approved, :bool

	add_index :events, :name, unique: true
	add_index :events, :label
	add_index :events, :age_restrict
	add_index :events, :location
	add_index :events, :date
	add_index :events, :cost
	
  end
end
