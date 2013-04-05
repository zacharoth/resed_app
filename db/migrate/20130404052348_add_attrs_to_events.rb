class AddAttrsToEvents < ActiveRecord::Migration
  def change
	add_index :events, :name, unique: true
	add_index :events, :label
	add_index :events, :age_restrict
	add_index :events, :location
	add_index :events, :date
	add_index :events, :cost
  end
end
