class Comment < ActiveRecord::Base
  ## Associations ##
  # Sets up a relationship between two models
  belongs_to :post # In this case a one-to-many r'ship

  ## Validations ##
  validates :body, presence: true
  validates :author_name, presence: true
  validates :post, presence: true

## Callbacks ##
# Hooks for tapping in to the lifecycle of an AR object.
  before_validation :set_author_name

## Private instance methods ##
# Contains methods just for use in this class, not to be used by other objects.
  private
  def set_author_name
    unless author_name.present?
      self.author_name = "Anonymous"
    end
  end
end
