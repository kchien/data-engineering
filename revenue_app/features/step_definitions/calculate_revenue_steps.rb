Given(/^I have a file named "(.*?)" with the following content:$/) do |file_name, file_content|
  write_file(file_name, file_content)
end

When(/^I upload the revenue file$/) do
  visit new_revenue_path
end

Then(/^I should see a gross revenue of \$(\d+)$/) do |revenue|
  page.should have_content(revenue)
end
