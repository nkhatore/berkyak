# BerkYak

**Team Members:** Nilay Khatore, Felix Li,  Avinash Nandakumar

**Idea:** A Yik-Yak clone that allows anonymous posting, commenting, and upvoting. The posts that a user sees are based on the user’s IP location.

**Models and Descriptions:**

Users
  * Users sign up and login by giving email and password (using Devise gem)
  * Has many posts, many comments, cumulative votes
  * Autodeleted/autobanned if 3 posts autodeleted

Posts
  * Has text of post, cumulative votes, many comments, and location id.
  * Autodeleted after 24 hours
  * Autodeleted if it has a cumulative vote score of -2

Comments
  * Has text of comment, cumulative votes, belongs to a post, and belongs to a user
  * Autodeleted if post is autodeleted

Location
  * Used Geocoder gem to get ip address of user (not used in class)
  * User has a location and location has many posts

**Features:**

User Features
  * Users can register an account and log in
  * Users can make and view posts
  * Users can comment on posts
  * Users can upvote, downvote posts

Search Features
  * Keyword matches in posts shown to user
  * Exact keyword matches
  * Search form on top
  * Redirect to new page showing results

Sort Features
  * Sort the posts by either “hot” or “new”
  * Hot search renders an html page with posts in the user’s location ordered by most upvotes to least
  * New search renders an html page with posts in the user’s location ordered by most to least recently posted

Geolocation
  * Every time user logs in, fetches their location using Geocoder gem
  * Shows logged-in user posts based on where user is located

**Division of Labor:**
* Felix: Location features, made models, controllers
* Avi: Search feature,  frontend
* Nilay: Voting, sorting by hot/new, frontend
