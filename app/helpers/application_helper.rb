module ApplicationHelper

  def full_title(page_title)
    base_title = "ecosteader > design lean.  build green."
    if page_title.empty?
      base_title
    else
      "#{base_title} > #{page_title}"
    end
  end

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / Integer(max.count) * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :hard_wrap => true)
    return markdown.render(text).html_safe
  end

end
