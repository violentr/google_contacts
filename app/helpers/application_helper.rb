module ApplicationHelper
  def app_name
    Rails.application.class.parent_name
    .underscore
    .humanize
    .split
    .map(&:capitalize)
    .join(' ')
  end
end
