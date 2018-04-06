class BudgetPage
  #include PageObject

# Declare WebElements Locator  for Budget Page

  @@categoryList = "categoryId"
  @@descriptiontextfield = "description"
  @@valuetextfield = "value"
  @@addbutton = "//button[text()='Add']"
  @@TransactionTableRows = "//table/tbody//tr"


  @@TotalInFlowField = "//div[text()='Total Inflow']/../div[1]"
  @@TotalOutFlowField = "//div[text()='Total Outflow']/../div[1]"
  @@WorkingBalanceField = "//div[text()='Working Balance']/../div[1]"
  # //div[text()='Total Inflow']/../div[1]
  # //div[text()='Total Inflow']/..//div[contains(@Class,'Balance-style-pos')]

  @@CurrentTotalInflowAmount = "0"
  @@CurrentTotalOutflowAmount = "0"
  @@CurrentWorkingBalanceAmount = "0"



  # Contructor That will Prepare the Browser

  def initialize(browser)
    @browser = browser
  end



# Function to Go to Budget Application
def gotToPage(url)
  @browser.goto(url)
end


# Function to Add A Income Transaction
  def addincometransaction(catagoty,description,amountvalue )

    @browser.select_list(:name,@@categoryList).select catagoty
    @browser.element(:name, @@descriptiontextfield).send_keys description
    @browser.element(:name, @@valuetextfield).send_keys amountvalue
    @browser.element(:xpath, @@addbutton).click

    return true

  end

# Function Validate Table Last Row
  def ValidateTableLastRow(catagoty,description,amountvalue)

    expectedrowtext = catagoty.to_s + description.to_s + amountvalue.to_s

    # Stripe Special Character / Decimal to Compare
      re = /(\d\.\d)|[^a-zA-Z\d]/
      str = expectedrowtext
      subst = '\\1'
      result = str.gsub(re, subst)
      result = result.gsub(/(\.)0+$/, '') ## Take Out the Decimal Part of the Number

    expectedrowtext = result
puts "\nTransaction Added : " + expectedrowtext

    list = @browser.elements(:xpath,  @@TransactionTableRows)
    lastrow = list.count - 1 # because array start from 0
    #puts lastrow
    list.each_with_index do |element,index|
      #browser.execute_script("arguments[0].style.backgroundColor = '"+"yellow"+"'",  list[index])
      #puts list[index].text
      #puts "\n"

      if index.equal?(lastrow)
        @browser.execute_script("arguments[0].style.backgroundColor = '"+"yellow"+"'",  list[index])
        actualrowtext = list[index].text.delete!("\n")

        # Stripe Special Character for Compare
          re = /(\d\.\d)|[^a-zA-Z\d]/
          str = actualrowtext
          subst = '\\1'
          result = str.gsub(re, subst)
          result = result.gsub(/(\.)0+$/, '')

        actualrowtext = result
puts "Transaction Confirmed : " +  actualrowtext
        #puts "============================================="

        #comparing with Expected Text
        if  actualrowtext == expectedrowtext
puts "Add Remove Transaction : PASSED......."
          return true
        else
puts "Add Remove Transaction : Failed :-(......."
          return false
        end
      end
    end


  end

  def storeCurrentTotalInflow

    @@CurrentTotalInflowAmount =  @browser.element(:xpath, @@TotalInFlowField).text
    puts "\nStoring  Current Total In-Flow Amount  : " + @@CurrentTotalInflowAmount

  end

  def storeCurrentTotalOutflow

    @@CurrentTotalOutflowAmount =  @browser.element(:xpath, @@TotalOutFlowField).text
    puts "\nStoring Current Total Out-Flow Amount  : " +  @@CurrentTotalOutflowAmount

  end

  def storeCurrentWorkingBalanceAmount

    @@CurrentWorkingBalanceAmount =  @browser.element(:xpath, @@WorkingBalanceField).text
    puts "\nStoring Current Working-Balance Amount : " + @@CurrentWorkingBalanceAmount

  end



  def ValidateAmountIncreased(forInOutBlanceAmount)

    puts "\nValidating Increas Of  : " + forInOutBlanceAmount


      ########################Outflow Amount
        if forInOutBlanceAmount=="CurrentTotalOutFlowNumber"
          newAmount = @browser.element(:xpath, @@TotalOutFlowField).text
          puts "New Amount After transaction : " + newAmount
          puts "Old Amount Before transaction : " + @@CurrentTotalOutflowAmount
          if stripCharacterAndMakeInteger(newAmount) > stripCharacterAndMakeInteger(@@CurrentTotalInflowAmount)
            puts "New Amount Is > Old AMount Test : Passed ..... "
            return true
          else
            puts "New Amount Is > Old AMount Test : Failed ..... "
            return false
          end
        end

      ########################Inflow Amount
        if forInOutBlanceAmount=="CurrentTotalInFlowNumber"
          newAmount = @browser.element(:xpath, @@TotalInFlowField).text
          puts "New Amount After transaction : " + newAmount
          puts "Old Amount Before transaction : " + @@CurrentTotalInflowAmount
          if stripCharacterAndMakeInteger(newAmount) > stripCharacterAndMakeInteger(@@CurrentTotalInflowAmount)
            puts "New Amount Is > Old AMount Test : Passed ..... "
            return true
          else
            puts "New Amount Is > Old AMount Test : Failed ..... "
            return false
          end
        end

      ######################## Working Balance Amount
        if forInOutBlanceAmount=="CurrentWorkingBalanceNumber"
          newAmount = @browser.element(:xpath, @@WorkingBalanceField).text
          puts "New Amount After transaction : " + newAmount
          puts "Old Amount Before transaction : " + @@CurrentWorkingBalanceAmount

          if stripCharacterAndMakeInteger(newAmount) > stripCharacterAndMakeInteger(@@CurrentWorkingBalanceAmount)
            puts "New Amount Is > Old AMount Test : Passed ..... "
            return true
          else
            puts "New Amount Is > Old AMount Test : Failed ..... "
            return false
          end
        end

  end




  def ValidateAmountdecreased(forInOutBlanceAmount)

    puts "\nValidating Decrease Of  : " + forInOutBlanceAmount


    ########################  Outflow Amount
      if forInOutBlanceAmount=="CurrentTotalOutFlowNumber"
        newAmount = @browser.element(:xpath, @@TotalOutFlowField).text
        puts "New Amount After transaction : " + newAmount
        puts "Old Amount Before transaction : " + @@CurrentTotalOutflowAmount
        if stripCharacterAndMakeInteger(newAmount) < stripCharacterAndMakeInteger(@@CurrentTotalInflowAmount)
          puts "New Amount Is < Old AMount Test : Passed ..... "
          return true
        else
          puts "New Amount Is < Old AMount Test : Failed ..... "
          return false
        end
      end

    ########################  Inflow Amount
      if forInOutBlanceAmount=="CurrentTotalInFlowNumber"
        newAmount = @browser.element(:xpath, @@TotalInFlowField).text
        puts "New Amount After transaction : " + newAmount
        puts "Old Amount Before transaction : " + @@CurrentTotalInflowAmount
        if stripCharacterAndMakeInteger(newAmount) < stripCharacterAndMakeInteger(@@CurrentTotalInflowAmount)
          puts "New Amount Is < Old AMount Test : Passed ..... "
          return true
        else
          puts "New Amount Is < Old AMount Test : Failed ..... "
          return false
        end
      end

    ########################  Working Balance  Amount
      if forInOutBlanceAmount=="CurrentWorkingBalanceNumber"
        newAmount = @browser.element(:xpath, @@WorkingBalanceField).text
        puts "New Amount After transaction : " + newAmount
        puts "Old Amount Before transaction : " + @@CurrentWorkingBalanceAmount
        if stripCharacterAndMakeInteger(newAmount) < stripCharacterAndMakeInteger(@@CurrentWorkingBalanceAmount)
          puts "New Amount Is < Old AMount Test : Passed ..... "
          return true
        else
          puts "New Amount Is < Old AMount Test : Failed ..... "
          return false
        end
      end

  end



    def stripCharacterAndMakeInteger(targetvalue)
      re = /(\d\.\d)|[^a-zA-Z\d]/
      str = targetvalue
      subst = '\\1'
      result = str.gsub(re, subst)
      result = result.gsub(/(\.)0+$/, '')

      return  result.to_i

    end

end

