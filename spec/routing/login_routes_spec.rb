require 'rails_helper'

	RSpec.describe "Login route", :type => :routing do
		it "routes GET /sessions/new to sessions#new" do
		  expect(:get => "/sessions/new").to route_to("sessions#new")
		end

		it "Creates new session" do
			expect(:post => "/sessions").to route_to("sessions#create")
		end

		it "Destroys a session" do
			expect(:delete => "/sessions/1").to route_to("sessions#destroy", :id => "1")
		end
	end
