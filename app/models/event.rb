class Event < ActiveRecord::Base
  attr_accessible :location, :name, :age_restrict, :label, :website, :date,
		:time, :address, :description, :cost, :date_applicable, :all_day,
		:repeat, :day

  enum_attr :age_restrict, %w(none 18+ 21+)
  enum_attr :label, 
	%w(music sports food/beverage fine_arts outdoors shopping movies festival)
  enum_attr :cost, %w(free <$15 <$30 <$50 >$50)
  enum_attr :repeat, %w(none daily weekly monthly bimonthly)
  enum_attr :day, %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
				
  validates :name, presence: true, length: { maximum: 50 },
			uniqueness: { case_sensitive: false }
  validates :location, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  
end
