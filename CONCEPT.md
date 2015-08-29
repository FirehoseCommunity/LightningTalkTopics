### This will be a file specifically designed for notes, thoughts, and plans for the application.

##### What will we need?
* Talks
* Topics
* Users (contributors)
* Schedule

talks has_many topics
      has_many users

topic belongs_to talks

users has_many topics
      has_many talks


Designed to be a grid card system.
The "assign to" will be a star, when a user clicks on the star they will be assigning the topic to themselves.
Then a user will be able to select a date/time to give the talk.
Users can upvote a topic to generate demand for a speaker to choose that topic.

A talk will be limited to 6 talks at most.
A talk will need at least 5 speakers in order to hold a talk.
A talk must only be 7-10 minutes of initial talk time.

A user can create, edit, destroy, and assign a topic.
A user can select a date and available slot to present the topic.
A user can upload their talk slides to the talk. (future feature)

A visitor/user can view a history of talks given.
A visitor/user can watch a talk that has been recorded and uploaded.
A visitor/user can share a talk that has been given.
A visitor can view talk topics.

A topic has a name.
A topic has a short description.
A topic has an assignment (boolean True/False).
A topic has a presentation date.
A topic has a timestamp.
Topic names are indexed.
Topics will be searchable.
Topics can be a series (ex: bootstrap 1, bootstrap 2, bootstrap 3)

Navbar will have the Firehose layout.
Navbar will have a dropdown with links to the Firehose pages (Primary, Community, and any future projects)
Navbar with have a sign in & sign up link.
Navbar will have a user dashboard (future feature).
