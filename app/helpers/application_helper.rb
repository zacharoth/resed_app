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

  def sortable(column, title = nil)
	title ||= column.titleize
	direction = 
	  (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
	link_to title, :sort => column, :direction => direction
  end

end
