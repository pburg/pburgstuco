module ApplicationHelper
  # Generates a generic page title. Prepend +title+ with "PHS Student Council"
  # and a pipe for separation. If +title+ is blank, simply return
  # "PHS Student Council Website".
  #
  #   page_title "Test Page"  # => "PHS Student Council | Test Page"
  #   page_title nil          # => "PHS Student Council Website"
  def page_title(title)
    "PHS Student Council #{title.blank? ? "Website" : "| #{title}"}"
  end

  # Generates a link for a navigation bar. It is an <tt>li</tt> element and
  # will have the <tt>active</tt> class if the current location is in +paths+.
  #
  #   # If the current page is the root of the website:
  #   nav_link "Home", root_path
  #     # => '<li class="active"><a href="/">Home</a></li>'
  #
  #   # If the current page is not the root of the website:
  #   nav_link "Home", root_path  # => '<li><a href="/">Home</a></li>'
  #
  # If multiple paths are passed in, it will be active if any of the paths
  # match. The inner <tt>a</tt> tag will always link to the first path.
  #
  #   # If the current page is either the about page or the contact page:
  #   nav_link "Some Pages", about_path, contact_path
  #     # => '<li class="active"><a href="/about">Some Pages</a></li>'
  #
  #   # If the current page is neither the about page nor the contact page:
  #   nav_link "Some Pages", about_path, contact_path
  #     # => '<li><a href="/about">Some Pages</a></li>'
  def nav_link(text, *paths)
    attrs = paths.any? { |p| current_page?(p) } ? { :class => "active" } : {}
    content_tag(:li, attrs) { link_to text, paths.first }
  end
end
