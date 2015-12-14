class Post < ActiveRecord::Base
  def pull_quote?
    pull_quote.present?
  end

  def a_week_old?
    created_at <= 1.week.ago
  end

  def date
    created_at.strftime("%d-%m-%y")
  end
end
