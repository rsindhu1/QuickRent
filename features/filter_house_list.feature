Feature: display list of houses filtered by rating
 
  As a concerned parent
  So that I can quickly browse houses appropriate for my family
  I want to see houses matching only certain ratings

Background: houses have been added to database

  Given the following houses exist:
  | title                   | rating     | release_date | price  |
  | 11 Catherine Street     | Vestal     | 25-Mar-2016  | 350.00 |
  | 44 Schiller             | Binghamton | 26-Mar-2016  | 325.00 |
  | 207                     | Downtown   | 21-Mar-2016  | 375.00 |
  | 209                     | Endicott   | 10-Apr-2016  | 250.00 |
  | murray                  | Vestal     | 5-Apr-2016   | 275.00 |
  | oak                     | Downtown   | 15-Apr-2016  | 175.00 |
  And  I am on the QuickRent home page

Scenario: restrict to houses with 'Vestal' or 'Endicott' ratings
  When I check the following ratings: Vestal Endicott
  
  # enter step(s) to uncheck all other checkboxes
  When I uncheck the following ratings: Downtown Binghamton
  
  # enter step to "submit" the search form on the homepage
  When I press "Refresh"
  
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see the following houses: "11 Catherine Street", "209", "murray"

  # enter step(s) to ensure that other movies are not visible
  And I should not see the following houses: "44 Schiller", "207"

Scenario: all ratings selected
  # see assignment
  When I check the following ratings: Vestal Binghamton Downtown Endicott
  And I press "Refresh"
  Then I should see all the houses
