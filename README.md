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
#   :title => "Harry Poter"
#   :rating => "10"  
# }
# ]

# gatsby = books[0]
# potter = books[1]

# gatsby[:rating] #=> 10
# potter[:rating] #=> 10
