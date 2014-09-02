require 'spec_helper'

describe Category do
  context "validations" do
  	it {should validate_presence_of :name}
  	it "should validate presenece of name" do
	    expect {
	    	category = Category.new
	    	category.save
	    	expect(category.errors.full_messages).to include("Name can't be blank")
	    }.to change{Category.count}.by(0)
	end
	it "should increase Category Count" do
		 expect{
		 	category = Category.new
		 	category.name = "Houses"
		 	category.save
		 }.to change {Category.count}.by(1)


	end
  end

  context "associations" do

	  it {should have_many :posts}

	  it "has many posts" do
	     expect {
	      category = Category.new
          category.posts << FactoryGirl.create(:post)
          category.save

	    }.to change {Post.count}.by(1)
	  end



  end

end