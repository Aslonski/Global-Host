require 'rails_helper'

RSpec.describe UsersController, type: :controller do
		
 let! (:andrey) {User.create(first_name: "Andrey", last_name: "Slonski", password_digest: "password", email:"a@a.a", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The man", language: "English", gender: "Male", is_host: true)}


  it "renders the index template" do
  	search_term = "woo"
  	users = double(:users)
  	expect_any_instance_of(User).to receive(:search).with(search_term).and_return(users)
    get :index, {search: search_term}, {user_id: 1}
    expect(assigns(:users)).to eq users

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template("index")
  end
end
