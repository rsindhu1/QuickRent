Feature: Welcome page
    Welcome page should have content
 
    Scenario: Should have welcome page
        Given I am viewing welcome page
        Then page should have the content "Welcome to QuickRent."