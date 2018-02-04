# IDEA BOX
Idea Box is a web app created in Rails and deployed to Heroku at: sheltered-scrubland-99592

Users can create ideas and associate their ideas with categories and images as a way to keep track of and organize ideas. Administrators are able to create and destroy Categories and Images.

_General Information_

Idea Box makes use of the Ruby on Rails framework and Active Record, with a PostgreSQL database.
This application was assigned by the Turing School of Software and Design, and developed by Lauren Billington. 
Created from scratch in 4 days using TDD.

_Assignment_

From http://backend.turing.io/module2/projects/mini-project:

Project Option IdeaBox:

Let’s create an app to record your ideas. Host your app live on Heroku.


Ideas

    An idea can be created by a user.
    An idea can be edited/updated only by the user that created it.
    An idea can be destroyed only by the user that created it.
    When a user types a new idea into the form, there is a selection dropdown for choosing the correct category. See Categories below for more information.
    

Categories

    Ideas belong to a category.
    Categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create categories).
    Categories can be destroyed by a logged-in admin user (regular logged in users cannot destroy categories).


Images

    Users can add an image to their own idea.
    An image can have many ideas and an idea can have many images.
    Images can only be created by an admin user. The most simplistic way to implement images is to store a url to an online image. 


Authentication and Authorization

    Users need to log in to see their ideas.
    Users can only see their own ideas – they should not be able to visit another user’s page.
    Users cannot create ideas for other users.
    Users cannot create new categories – only the admin can do that.
    Users cannot create images – only the admin can do that; however, a user can assign an image to their idea.
    Visitors can create user accounts.



