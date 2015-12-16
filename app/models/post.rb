class Post < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :body, :length => { :in => 1..1500 }

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
