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

RESTful is the term for application logic which adheres to this convention of CRUD maps to POST, GET, PUT/ PATCH, DELETE respectively.
