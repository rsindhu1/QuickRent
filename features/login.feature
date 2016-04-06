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
  When I go to new page

#  When I fill in user_name with "Ankush"
#  And I fill in user_password with "arora"
  When I press "Login"
  
  # Then login should be successful
  #Then I should be 
  Then I should get message "Signed in successfully."
