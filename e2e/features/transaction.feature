Feature: Transaction Test
  In order to make sure Budgeting transaction Working Accuratly
  As a user
  I want to check I can Complete Positive & Negative Transaction

   @desktop
  Scenario: Create A Expense Transaction

   Given I Start Running Scenario "Create A Expense Transaction"

     Given I Land on BudgetApplication
    And I Store "CurrentTotalOutFlowField" Text
     And I Store "CurrentWorkingBalanceAmount" Text

     When I Add A Transaction as
      | Category | Description | Value |
      | Travel   | Las Vegas   | 1000  |

    Then I Validate Transaction Added to Last Row
      | Category | Description | Value |
      | Travel   | Las Vegas   | 1000  |

     Then I Validate "CurrentTotalOutFlowNumber" increased
     Then I Validate "CurrentWorkingBalanceNumber" decreased

    And I Stop Running


  @desktop
  Scenario: Create A Income Transaction

    Given I Start Running Scenario "Create A Income Transaction"

    Given I Land on BudgetApplication
    And I Store "CurrentTotalInFlowField" Text
    And I Store "CurrentWorkingBalanceAmount" Text

    When I Add A Transaction as
      | Category | Description | Value |
      | Income   | Salary      | 5000  |

    Then I Validate Transaction Added to Last Row
      | Category | Description | Value |
      | Income   | Salary      | 5000  |

    Then I Validate "CurrentTotalInFlowNumber" increased
    Then I Validate "CurrentWorkingBalanceNumber" increased

    And I Stop Running

