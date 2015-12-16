# Notes

##Loops (blocks)

Ruby uses block to enumerate over _enumerable_ objects. To make a "loop" you can pass a block to an enumerable method. Enumerable methods are available on objects that represent lists, e.g Arrays and Hashes. A block starts with a `do` and ends with an `end`. A block optionally also has an argument which appears between pipes `|foo|`

Each is an enumerable method which, when given a block (do..end) iterates over a list passing _each_ item in list to the block via the argument in pipes.

Here's an example of a loop in ruby.

```
  @posts.each do |post|
    post
  end
```

## Routing

The `config/routes.rb` this is the first port of call for any request. This file determines what ruby logic handles incoming requests by routing to a controller action.

We make a request by clicking links, typing in urls and submitting forms. Clicking links and typing in URLs are examples of requests that use the HTTP verb "GET". Submitting forms allow you to make different types of requests:

- POST
- PUT
- PATCH
- Delete
- GET

Each of these request verbs (aka methods) is supposed to be used for a different purpose:
- Create actions use POST
- Create read actions use GET
- Update actions use PUT or PATCH
- Destroy actions use DELETE

RESTful is the term for application logic which adheres to this convention of CRUD maps to POST, GET, PUT/ PATCH, DELETE respectively. It stands for REpresentational State Transfer.

To provide an app with all seven RESTful routes use the recsources method in the config/routes.rb file with the name of the resource as an argument:

'''
# config/routes.rb
Blog::Application.routes.draw.do
  resources :posts
  resources :repos
  resources :products
end
'''

To look at all the routes available to your application run a rake task:

'''
$ rake routes
'''

---

## Controllers

Controller actions are public methods in a controller file. They act as an end point for a request. They should only handle very simple logic - they're only responsible for rendering views and offload any complex logic to other parts of the app.

## Hashes

A hash is a data type. Each item in a hash is a key value pair.

'''
def build_hash_of_books
  hash = {}
  @books_titles.each do |book|
    hash [:title] = book
  end
  @books_rating.each do |rating|
    hash [:rating] = rating
  end
end

# [
# {
#   :title => "The Great Gatsby"
#   :rating => "10"
# },
# {
#   :title => "Harry Potter"
#   :rating => "10"  
# }
# ]

# gatsby = books[0]
# potter = books[1]

# gatsby[:rating] #=> 10
# potter[:rating] #=> 10


## Views

View files are html peppered with ruby. Generally the less ruby logic in the view the better.
Views are for HTML structure, they should be clear and uncluttered. Rails provides helpers for handling logic
in views neatly. We can also make use of partials to keep views succinct and DRY (don't repeat yourself). "Repetition is better than the wrong abstraction"

## Helpers

Helper methods are magically mixed in to rails views, they are a convinient place to put application logic that would otherwise clutter the view. Don't lean too heavily on helpers, ie don't bloat helper methods with really complex stuff because they are globally available. There are other places that can be reasonable for complex code.

## Models

A model is the interface to a resources database table. We reach in to the database via the model to Crate, Read, Update and Destroy records (rows). The model file is responsible for code related to that resource. These are generally fatter than controllers and contain more methods than helper files.

They inherit lots of methods for interacting with the DB from `ActiveRecord::Base`.

- `Post.all`
- `Post.find(1)`
- `Post.find(2)`
- `Post.find(params[:id])`
- `Post.destroy`
- `@post.update(title :"foobar")`

## Methods

Methods are messages we can send to objects, objects that receive a message is known as the receiver.
The message is said to be "called".You can send the message in a few ways. Most common way is for the
receiver to be followed by a full stop and the name of the method being called.

'''
# Receiver.method_being_called
      method
      /
POST.all
^receiver
             method
             /
@post.destroy
^ receiver
'''

You can also use Ruby's 'send' method to send the message:

'''
# Receiver.send(:method_being_called)

Foo.send(:bar)
baz.send(:quux)
'''

The receiver might be a class (e.g Post) or it might be an instance (contained within a variable or an instance - @var).
Depending on what it is we say the method is an instance method or a class method.

To define an instance method on a class, open a class and use the `def` keyword:

'''
class Foo
  def bar
  end
end

class Post
  def is_published?
    true
  end
end
'''

An instance is an object created when a class is instantiated (usually with the `new` method
- but there are other constructor methods as well).

'''
@Post = Post.new

@Post <-- is now an instance

'''
To define a class method open up a class and use the `def` keyword along with the `self` keyword.

'''
class Foo
  def self.my_class_method
    puts "foobar"
  end
end

class User
  def self.send_confirmations
    unconfirmed.send_email(:confirmation)
  end
end

User.send_confirmations

'''

## Accomodation
### hotel
### B&b
### Apartment

- number of rooms - integer
- price - integer
- location
  - address - string
  - latitude/ longitude - float
- amenities
  - tv
  - spa
  - swimming pool
- availability
- rating

- name - string (dynamic?)
- accomodation_type - string (selectable)
- number_of_rooms - integer
- price_in_pence - integer
- latitude - float
- lang - float
- address - string (dynamic?)

# post
- id - integer
- title - string
- body - text
- pull_quote - string
- comment_count - dynamically found from comments table

- author-name - string
- comments - another table
- likes - integer

# comments
- body - text
- author-name - string
- post_id
