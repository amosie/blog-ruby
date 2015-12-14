unless Rails.env.development?
  raise 'Running rake db:seedin production potentially dangerous'
end

ActiveRecord::Base.transaction do
  Post.destroy_all

  posts = Post.create(
    [
    {
    :title => "Hello world",
    :body => "My first blog post",
    :pull_quote => "Awesome quote"
    },

    {
    :title => "Learning ruby",
    :body => "My second blog post",
    :created_at => 2.weeks.ago
    },

    {
    :title => "Why I hate ruby",
    :body => "My third blog post"
    }
   ]
  )
end
