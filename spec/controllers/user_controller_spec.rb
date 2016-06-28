require 'rails_helper'

RSpec.describe UsersController, type: :controller do
		#   describe 'Create User' do
		#     before { post :index }

		#     it { should set_session }
		# 	 end

		# it "should create a new user" do
		#   user_count = User.count 
		#   create_user("user A")
		#   expect(user_count + 1).to eq(User.count)
		# end

		# def create_user(name)
		#   post :create, {name: name}
		# end

 #  end
 let! (:andrey) {User.create(first_name: "Andrey", last_name: "Slonski", password_digest: "password", email:"a@a.a", city: "Chicago", state_province: "IL", country: "USA", personal_info: "The man", language: "English", gender: "Male", is_host: true)}


  xit "renders the index template" do
  	search_term = "woo"
  	users = double(:users)
  	expect_any_instance_of(User).to receive(:search).with(search_term).and_return(users)
    get :index, {search: search_term}, {user_id: 1}
    expect(assigns(:users)).to eq users
  end

end
