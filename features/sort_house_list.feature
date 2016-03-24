Feature: display list of houses sorted by different criteria
 
  As an avid renter
  So that I can quickly browse houses based on my preferences
  I want to see houses sorted by name

Background: houses have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | 11 Catherine Street     | G      | 25-Mar-2016  |
  | 44 Schiller             | R      | 26-Mar-2016  |
  | 207                     | R      | 21-Mar-2016  |
  | 209                     | PG-13  | 10-Apr-2016  |
  | murray                  | PG-13  | 5-Apr-2016   |

  And I am on the RottenPotatoes home page

Scenario: sort houses alphabetically
  When I follow "House"
  # your steps here
  Then I should see "11 Catherine Street" before "44 Schiller"
  
Scenario: sort houses in increasing order of release date
  When I follow "Date available"
  # your steps here
  Then I should see "207" before "209"