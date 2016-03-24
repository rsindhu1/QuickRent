Feature: display list of houses sorted by different criteria
 
  As an avid renter
  So that I can quickly browse houses based on my preferences
  I want to see houses sorted by name

Background: houses have been added to database
  
  Given the following houses exist:
  | title                   | rating     | release_date |
  | 11 Catherine Street     | Vestal     | 25-Mar-2016  |
  | 44 Schiller             | Binghamton | 26-Mar-2016  |
  | 207                     | Downtown   | 21-Mar-2016  |
  | 209                     | Endicott   | 10-Apr-2016  |
  | murray                  | Vestal     | 5-Apr-2016   |

  And I am on the RottenPotatoes home page

Scenario: sort houses alphabetically
  When I follow "House"
  # your steps here
  Then I should see "11 Catherine Street" before "44 Schiller"
  
