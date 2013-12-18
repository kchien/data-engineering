Given(/^I have a file named "(.*?)" with the following content:$/) do |file_name, file_content|
  @file_name = file_name
  write_file(@file_name, file_content)
end

When(/^I upload the revenue file$/) do
  visit new_revenue_path
  within("#new_revenue") do
    attach_file("revenue_purchases_file", File.join(current_dir, @file_name))
  end
  click_button("submit")
end

Then(/^I should see a gross revenue of \$(\d+)$/) do |revenue|
  page.should have_content(revenue)
end
