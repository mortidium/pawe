module ApplicationHelper
  include ActionView::Helpers::SanitizeHelper    

    
  def strippedtags(content)
    tags = %w(a acronym b strong i em li ul ol h1 h2 h3 h4 h5 h6 blockquote u img br cite sub sup ins p)
    sanitize(content, tags: tags, attributes: %w(href title))
  end
    
end
