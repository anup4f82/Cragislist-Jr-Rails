require 'spec_helper'

describe Post  do
	
context "validations" do
	it {should validate_presence_of :title}
	it {should validate_presence_of :body}
	it {should validate_presence_of :category}


end

context "associations" do
	it {should belong_to :category}
end
	
end