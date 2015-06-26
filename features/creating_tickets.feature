Feature: Creating Tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and do that

Background:
  Given there is a project called "Internet Explorer"
  Given there are the following users:
    | email    | password |
    | user@ticketee.com | password |
  And "user@ticketee.com" can view the "Internet Explorer" project
  And "user@ticketee.com" can create tickets in the "Internet Explorer" project
  And I am signed in as them
  And I am on the homepage
  When I follow "Internet Explorer"
  And I follow "New Ticket"


  #Then I should see "You need to sign in or sign up before continuing."
  #When I fill in "Email" with "user@ticketee.com"
  #When I fill in "Password" with "password"
  #And I press "Sign in"
  #Then I should see "New Ticket"

Scenario: Creating a ticket
  And I fill in "Title" with "Internet Explorer"
  And I fill in "Description" with "PORRAAAaaaaaA"
  And I press "Create Ticket"
  Then I should see "Ticket has been created."
  Then I should see "Created by user@ticketee.com"

Scenario: Creating a ticket with invalid attributes fails
  When I press "Create Ticket"
  Then I should see "Ticket has not been created."
  And I should see "Title can't be blank"
  And I should see "Description can't be blank"

Scenario: Description must be longer than 10 characters
  When I fill in "Title" with "Non-standards compliance"
  And I fill in "Description" with "it sucks"
  And I press "Create Ticket"
  Then I should see "Ticket has not been created."
  And I should see "Description is too short"

  Scenario: Creating a ticket with an attachment
    When I fill in "Title" with "Add documentation for blink tag"
    And I fill in "Description" with "The blink tag has a speed attribute"
    And I attach the file "spec/fixtures/speed.txt" to "File"
    And I press "Create Ticket"
    Then I should see "Ticket has been created."
   # Then I should see "speed.txt" within "#ticket .asset"