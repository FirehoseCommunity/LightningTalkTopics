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
A user can create, edit, destroy, and assign a topic.
A user can select a date and available slot to present the topic.
A visitor/user can view a history of talks given.
A visitor/user can watch a talk that has been recorded and uploaded.
A visitor/user can share a talk that has been given. 
