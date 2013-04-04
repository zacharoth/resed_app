class Event < ActiveRecord::Base
  attr_accessible :location, :name, :age_restrict, :label, :website, :date,
		:time, :address, :description, :cost

  enum_attr :age_restrict, %w(none 18+ 21+)
  enum_attr :label, 
	%w(music sports food/beverage fine_arts outdoors shopping movies festival)
  enum_attr :cost, %w(free <$15 <$30 <$50 >$50)

  validates :name, presence: true, length: { maximum: 50 },
			uniqueness: { case_sensitive: false }
  validates :location, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  
end
