# require 'rails_helper'
require 'spec_helper'

describe CategoriesController do

 context "index" do
 	it "is successful" do
 	  get :index
 	  expect(response).to be_success
 	end
 	it "is successful status" do
 	  get :index
 	  expect(response.status).to eq(200)
 	end
 	it "renders index template" do
      get :index
 	  expect(response).to render_template(:index)
 	end
 	it "assigns Categories to Category.all" do
 	  get :index
 	  expect(assigns(:categories)).to eq Category.all
 	end
end
  context "show" do
    let(:category) {FactoryGirl.create :category}
    it "is successful" do
  	  get :show,:id => category.id
  	  expect(response).to be_success
  	end
  	it "assigns @category to Category found by id" do
  	  get :show,:id => category.id
  	  expect(assigns(:category)).to eq(category)
  	end

  end

   context "new" do
	   it "is successful" do
	     get :new
	     expect(response).to be_success
	   end
	   it "assings a new Category" do
	     get :new
	     expect(assigns(:category)).to be_a_new Category
	   end
	end

    context "create" do
    	it "creates with valid attributes" do
    	  expect {
    	    post :create, :category => FactoryGirl.attributes_for(:category)
    	  }.to change{Category.count}.by(1)
    	  expect(response).to be_redirect
    	end
    	it "creates with valid attributes" do
    	  expect {
    	    post :create, :category => {name:"yyyy"}
    	  }.to change{Category.count}.by(1)
    	  expect(response).to be_redirect
    	end

    	
    end

    context "edit" do
    let(:category) {FactoryGirl.create :category}
    	it "is a success" do
    		get :edit,:id => category.id
    		expect(response).to be_success
        end
        it "assigns @category to Category found by id" do
          get :edit,:id => category.id
          expect(assigns(:category)).to eq(category)

        end
    end

    context "update" do 
      let!(:category) {FactoryGirl.create :category}
      it "updates with valid attributes" do
	       expect {
	       	  put :update,:id => category.id,:category => {:name =>"yo"}
	       }.to change {category.reload.name}
	       expect(response).to be_redirect
      end
      it "doesn update with invalid attributes" do
      	expect {
      		post :update,:id => category.id,:category => {:name => nil}
      	}.to_not change{category.reload.name}
      	expect(response).not_to be_redirect
      end
       it "doesnt update with invalid attributes" do
      	expect {
      		put :update,:id => category.id,:category => {:name =>"yppp"}
      	}.to_not change{Category.count}
      	expect(response).to be_redirect
      end
    end

    context "delete" do
    	let!(:category) {FactoryGirl.create :category}
    	it "deletes the record" do
    	  expect {
    	  	delete :destroy,:id=>category.id
    	  }.to change{Category.count}.by(-1)
    	end
    end


end

