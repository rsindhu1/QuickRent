Feature: login to QuickRent
 
 As a user
 So that I can access the features of the QuickRent
 I want to login in QuickRent

Background: users have been added to database
  
  Given the following users exist:
  | name           | password|
  | Ankush         | arora   |

  And I am on the QuickRent home page

Scenario: login functionality
  When I login using username 'Ankush' and password 'arora'
  # enter step(s) to uncheck all other checkboxes
  
  # enter step to "submit" the search form on the homepage
  When I press "Login"
  
  # enter step(s) to ensure that PG and R movies are visible
  Then login should be successful
  # enter step(s) to ensure that other movies are not visible