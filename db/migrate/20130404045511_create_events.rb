class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
	  t.enum :age_restrict
	  t.enum :label
	  t.string :website
	  t.time :time
	  t.date :date
	  t.string :address
	  t.string :description
	  t.enum :cost
	  t.boolean :approved

      t.timestamps
    end
  end
end
