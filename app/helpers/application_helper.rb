module ApplicationHelper

  # returns full title of particular page
  def full_title(page_title)
	base_title = "Vanderbilt University | Residential Education | Nashville Event Finder"
	if page_title.empty?
	  base_title
	else 
	  "#{base_title} | #{page_title}"
	end
  end

end
