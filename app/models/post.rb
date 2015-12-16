class Post < ActiveRecord::Base
  ## Associations ##
  # Dynamically generates #comments instance method which retrives all
  # comments whose foreign_key is the post_instance's id.
  has_many :comments, dependent: :destroy # This will delete all associated comments too

  ## Validations ##
  # Will add errors to @post instances according to the rules below and return false
  # upon save
  validates :title, :presence => true, :uniqueness => true
  validates :body, :length => { :in => 1..1500 }
  validates :author_name, :presence => true

  ## Callbacks ##
  # Hooks for tapping in to the lifecycle of an AR object.
  before_validation :set_author_name

  ## Public instance methods ##
  # Comprise the public interface (API) for @post instances.
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

## Public class methods ##

## Private instance methods ##
# Contains methods just for use in this class, not to be used by other objects.
private
def set_author_name
  unless author_name.present?
    self.author_name = "Anonymous"
  end
end
## Private class methods ##
