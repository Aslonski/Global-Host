require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do

	let (:current_user) {User.create(first_name: "Dre", last_name: "Slo", password_digest: "password", email:"g@g.g", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The man", language: "English", gender: "Male", is_host: true)}

	xit "has a collection of conversations" do
		get :index
		expect(assigns(:user)).to eq current_user
		started = "A "
		continued = "B"
		all_convos = started + continued
		expect(assigns(:conversations)).to eq all_convos
	end	
end