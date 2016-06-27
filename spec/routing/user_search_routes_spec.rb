require 'rails_helper'

RSpec.describe "User search routes", :type => :routing do
	it "Displays a page to search for users" do
		expect(:get => "/users/search").to route_to("users#search")
	end

	it "Displays a list of found users" do
		expect(:get => "/users").to route_to("users#index")
	end

	it "Displays a user profile" do
		expect(:get => "/users/1").to route_to("users#show", :id => "1")
	end

	it "Displays a page to update user profile" do
		expect(:put => "users/1").to route_to("users#update", :id => "1")
	end
end