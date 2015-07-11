Given(/^the following (.+) exist$/) do |factory, table|
  table.hashes.each do |hash|
    FactoryGirl::create(factory, hash)
  end
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit "/#{page_name}"
end

Then(/^I should see stores table$/) do |expected_table|
  stores_table = table_at('#stores-table').to_a
  expect(expected_table.rows).to eq(stores_table)
end

And /^(?:|I )pause$/ do
  STDERR.puts 'Pausing - press any key to continue'
  STDIN.getc

  puts "Continuing after pause"
end

def table_at(selector) # see https://gist.github.com/1149139
  Nokogiri::HTML(page.body).css(selector).map do |table|
    table.css('tr').map do |tr|
      tr.css('td').map { |td| td.text }
    end
  end[0].reject(&:empty?)
end