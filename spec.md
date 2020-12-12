# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app: Created the app Santa's Christmas List
- [x] Use ActiveRecord for storing information in a database: ActiveRecord migrations create database that holds user and gift information.
- [x] Include more than one model class (e.g. User, Post, Category): Has a User and a Gift class.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts): User has_many Gifts
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): Gifts belong_to a User.
- [x] Include user accounts with unique login attribute (username or email): User signs up with a username, email, and password. User model has validation method to ensure email and username are present and unique.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: Gifts can be created by a User. A User can view other Users gift list. However, a User can ONLY update or destroy their own gifts from their list.
- [x] Ensure that users can't modify content created by other users: Unauthorized method checks to see if the gift_user is the same as the session user before providing access to modify the gift.
- [x] Include user input validations: Uses ActiveRecord validations to cover this area.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new): Included one flash message that informs a user that they have successfully logged out.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: README file is included.

Confirm
- [x] You have a large number of small Git commits: As of 12/12/20 11:06am, 41 commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
