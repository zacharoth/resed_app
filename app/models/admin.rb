class Admin < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, length: { maximum: 50 },
			uniqueness: { case_sensitive: false }

  before_save { |admin| admin.name = name.downcase }  

end