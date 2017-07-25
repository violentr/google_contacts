module ApplicationHelper
  def app_name
    Rails.application.class.parent_name
    .underscore
    .humanize
    .split
    .map(&:capitalize)
    .join(' ')
  end

  def paginate(collection)
   per_page = 30
   number_of_pages = (collection.flatten.size / per_page)
   pages = (1..number_of_pages).to_a
   collection = pages.zip(pages)
   select_tag "pages", options_for_select(collection, 1)
  end

end
