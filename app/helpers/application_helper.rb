module ApplicationHelper


  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Task Manager"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
end