module ApplicationHelper
  def flash_warning
    flash.each do |key, value|
      content_tag :div, :class => key do
        content_tag :p, value
      end
    end
  end
end
