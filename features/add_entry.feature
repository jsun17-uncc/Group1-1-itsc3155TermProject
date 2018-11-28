Feature: Add a new Tip

    As an Interview Assistant Forum Participant, 
    So I can share my knowledge on Interviews,
    I want to be able to post my Interview Tips on the 
    General Tips Forum.
    
Scenario: As an expert in Interviews, I want to be able to post my tips on the forum to share my knowledge on interviews
    Given I am on the home page
    When I click on the "Add Tip" link
    Then I should be on the "New Tip" page
    And I should see the "Title" field
    And I should see the "Name" field
    And I should see the "Text" field