Feature: Transaction Test
  In order to make sure Budgeting report Working Accuratly
  As a user
  I want to check I can view accurate report

   @desktop
  Scenario: Display Income Vs Expense Report

   Given I Start Running Scenario "Display Income Vs Expense Report"

     Given I Land on BudgetApplication
     When I Add A Transaction as
      | Category | Description | Value |
      | Travel   | Las Vegas   | 1000  |

     And I click the "Reports" link
     And I click the "Inflow vs Outflow" link
     And I click the "Travel" span

    And I Stop Running