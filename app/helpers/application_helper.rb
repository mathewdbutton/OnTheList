module ApplicationHelper
  def turbolink_caching_directive
    return "" unless content_for?(:turbolink_caching_directive)
    "<meta name=\"turbolinks-cache-control\" content=\"#{content_for(:turbolink_caching_directive)}\">"
  end
end
