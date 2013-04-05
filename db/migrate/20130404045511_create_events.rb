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
	  t.boolean :date_applicable
	  t.boolean :all_day
	  t.enum :repeat
	  t.enum :day
	  t.string :address
	  t.string :description
	  t.enum :cost
	  t.boolean :approved

      t.timestamps
    end
  end
end
