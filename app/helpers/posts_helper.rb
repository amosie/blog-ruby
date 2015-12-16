module PostsHelper
  def pull_quote_for(post)
    if post.pull_quote?
      content_tag :blockquote, post.pull_quote
    end
  end

  def time_of(post)
    "Posted by #{ post.author_name } #{ time_ago_in_words(post.created_at) } ago."
  end

  def edit_of(post)
    if post.a_week_old?
      "Posted on #{ post.date }"
    else
      "Lasted updated #{ time_ago_in_words(post.updated_at) } ago."
    end
  end
end
