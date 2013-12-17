Feature: Calculate revenue from a plain text file, which we obtained from 
 the company that we just acquired.

Scenario: Upload a file with two rows
  Given I have a file with the following content:
    """
    purchaser name        item description        item price        purchase count        merchant address        merchant name
Snake Plissken        $10 off $20 of food        10.0        2        987 Fake St        Bob's Pizza
Amy Pond        $30 of awesome for $10        10.0        5        456 Unreal Rd        Tom's Awesome Shop
  """
  When I upload the revenue file
  Then I should see a gross revenue of $70
