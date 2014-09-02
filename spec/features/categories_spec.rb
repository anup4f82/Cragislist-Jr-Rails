require 'spec_helper'

describe  "Categories" ,:js=>true do
  let!(:category){FactoryGirl.create :category}
  let!(:post){FactoryGirl.create :post,:category => category}
   context "homepage" do
   		it "lists all categories" do
	   	  visit root_path
	   	  expect(page).to have_content category.name
	    end
	end

	context "categorypage" do
		it "should have all posts and Category title" do
			visit root_path
			click_on category.name
			expect(page).to have_content category.name
			expect(page).to have_content post.title
	    end
	end

	context "create a category" do
		it "should go to new page and create Category" do
		 visit new_category_path
		   fill_in "Name",:with => "Business"
		   click_on "Create"
		   expect(page).to have_content "Business"
		 end

		 it "should go to new page and create Category" do
			 visit new_category_path
			 click_on "Create"
			 expect(page).to have_content "Name can't be blank"
		 end
    end

    context "edit a category" do
     it "updates the Category name" do
       visit edit_category_path(category)
       fill_in "Name",:with => "Yo"
       click_on "EDIT"
       expect(page).to have_content "Yo"
    
     end
    end


end

	
