require 'rails_helper'

RSpec.describe "Conversation search routes", :type => :routing do
	it "Displays a list of conversations" do
		expect(:get => "/conversations").to route_to("conversations#index")
	end

	it "Creates a new conversation" do
		expect(:post => "/conversations").to route_to("conversations#create")
	end


end