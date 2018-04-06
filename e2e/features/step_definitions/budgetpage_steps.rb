
#require '../../page_objects/budget_page'

Given(/^I Start Running Scenario "([^"]*)"$/) do |arg|
  puts "Executing Scenario : " + arg
  puts "=========================================="
end

And(/^I Stop Running$/) do
  puts "=====XXX END Scenario XXXXXXXXX=========="

end


Given /^I Land on (.+)$/ do |page_name|

  @budgetapp = BudgetPage.new @browser
  @budgetapp.gotToPage(path_to(page_name))

end


And(/^I Store "([^"]*)" Text$/) do |arg|

  if arg =="CurrentTotalOutFlowField"
    @budgetapp.storeCurrentTotalOutflow
  end
  else if arg =="CurrentTotalInFlowField"
         @budgetapp.storeCurrentTotalInflow

         else if arg =="CurrentWorkingBalanceAmount"
                @budgetapp.storeCurrentWorkingBalanceAmount
              end
       end
end


When("I Add A Transaction as") do |table|

  data = table.hashes
  category = []
  description = []
  amountvalue = []

  #puts data
  ##==>> Iterating Through the Table
  data.each do |row|
    row.each do |key, value|
      if key.eql? "Category"
        category << value
      elsif key.eql? "Description"
        description << value
      elsif key.eql? "Value"
        amountvalue << value
      end
    end
  end

  # puts category
  # puts description
  # puts amountvalue

  @budgetapp.addincometransaction(category,description,amountvalue)

end


Then("I Validate Transaction Added to Last Row") do |table|

  data = table.hashes
  category = []
  description = []
  amountvalue = []

  #puts data
  ##==>> Iterating Through the Table
  data.each do |row|
    row.each do |key, value|
      if key.eql? "Category"
        category << value
      elsif key.eql? "Description"
        description << value
      elsif key.eql? "Value"
        amountvalue << value
      end
    end
  end

  # puts category
  # puts description
  # puts amountvalue

  # if category==Income
  #   #amountvalue = FormaterealDollarValue(amountvalue,Positive)
  # else
  #   #amountvalue = FormaterealDollarValue(amountvalue,Negetive)
  # end


  assert_equal(true,@budgetapp.ValidateTableLastRow(category,description,amountvalue))

end

Then(/^I Validate "([^"]*)" increased$/) do |arg|

  if arg =="CurrentTotalOutFlowNumber"
    assert_equal(true,@budgetapp.ValidateAmountIncreased("CurrentTotalOutFlowNumber"))
  end

  if arg =="CurrentTotalInFlowNumber"
    assert_equal(true,@budgetapp.ValidateAmountIncreased("CurrentTotalInFlowNumber"))
  end

  if arg =="CurrentWorkingBalanceNumber"
    assert_equal(true,@budgetapp.ValidateAmountIncreased("CurrentWorkingBalanceNumber"))
  end



end






Then(/^I Validate "([^"]*)" decreased/) do |arg|
  if arg =="CurrentTotalOutFlowNumber"
    assert_equal(true,@budgetapp.ValidateAmountdecreased("CurrentTotalOutFlowNumber"))
  end

  if arg =="CurrentTotalInFlowNumber"
    assert_equal(true,@budgetapp.ValidateAmountdecreased("CurrentTotalInFlowNumber"))
  end

  if arg =="CurrentWorkingBalanceNumber"
    assert_equal(true,@budgetapp.ValidateAmountdecreased("CurrentWorkingBalanceNumber"))
  end


end


