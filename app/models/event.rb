class Event < ActiveRecord::Base
  attr_accessible :location, :name, :age_restrict, :label, :website, :date,
		:time, :address, :description, :cost, :date_applicable, :all_day,
		:repeat, :day, :issue

  enum_attr :age_restrict, %w(none 18+ 21+)
  enum_attr :label, %w(music sports food/beverage fine_arts outdoors 
			shopping movies festival comedy charity holiday/seasonal books)
  enum_attr :cost, %w(free less_than_$15 less_than_$30 less_than_$50 
					more_than_$50)
  enum_attr :repeat, %w(none daily weekly monthly bimonthly)
  enum_attr :day, %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
				
  validates :name, presence: true, length: { maximum: 50 },
			uniqueness: { case_sensitive: false }
  validates :location, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  
  def self.search(search, page, sort, direction)
	paginate :per_page => 25, :page => page,
			 :conditions => ['name LIKE :search OR location LIKE :search OR 
					label LIKE :search OR description LIKE :search OR 
					address LIKE :search OR website LIKE :search',
					{:search =>"%#{search}%"}],
			 :order => ("#{sort} #{direction}" || 'date desc')	
  end

  @issue_event = nil

end
