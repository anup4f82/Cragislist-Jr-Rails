require 'spec_helper'
require 'selenium-webdriver'
require 'faker'

driver = Selenium::WebDriver.for :firefox

10.times {
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

driver.navigate.to "http://localhost:3000"
element = driver.find_element(:link,'Create New Category')
element.click

wait.until { driver.find_element(:id,"category_name") }
element = driver.find_element(:id,'category_name')
element.send_keys Faker::Lorem.word
element.submit
wait.until {driver.find_element(:link,'Home')}
element = driver.find_element(:link,'Home')
element.click
wait.until{driver.find_element(:tag_name,"h1")}
}


driver.navigate.to "http://localhost:3000"

element = driver.find_elements(:tag_name,"a")
p element[0].text

links = []
element.each do |x|
     links << x.text
  end

# links.delete(0)
# p links

links.each do |x|
	wait.until {driver.find_element(:link,x)}
	e = driver.find_element(:link,x)
	e.click
	wait.until {driver.find_element(:link,'Home')}
	p = driver.find_element(:link,"Create a New Post")
	p.click
	wait.until{driver.find_element(:link,'Home')}
	title = driver.find_element(:id,'post_title')
	title.send_keys Faker::Lorem.characters(10)
	body = driver.find_element(:id,"post_body")
	body.send_keys Faker::Lorem.paragraph
    body.submit
    wait.until {driver.find_element(:link,'Home')}
	element = driver.find_element(:link,'Home')
     element.click

end
