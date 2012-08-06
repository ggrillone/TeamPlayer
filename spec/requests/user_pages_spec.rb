require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

		it { should have_selector('h1', text: "#{user.first_name} #{user.last_name}") }
		it { should have_selector('title', text: "#{user.first_name} #{user.last_name}") }
	end

  describe "signup page" do
  	before { visit signup_path }
    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end

  describe "signup" do
  	before { visit signup_path }
  	let(:submit) { "Create my account" }

  	describe "with invalid information" do
  		it "should not create a user" do
  			expect { click_button submit }.not_to change(User, :count)
  		end

  		describe "after submission" do
  			before { click_button submit }

  			it { should have_selector('title', text: 'Sign up') }
  			it { should have_content('error') }
  		end
  	end

  	describe "with valid information" do
  		before do
  			fill_in "First name",					with: "Example"
  			fill_in "Last name", 					with: "User"
  			fill_in "Email",							with: "user@example.com"
  			fill_in "Password",						with: "foobar"
  			fill_in "Password confirmation",				with: "foobar"
  		end
  		it "should create a user" do
  			expect { click_button submit }.to change(User, :count).by(1)
  		end

  		describe "after submission" do
  			before { click_button submit }

  			it { should have_selector('title', text: 'Example User') }
  			it { should have_selector('div', text: 'Welcome to TeamPlayer :)') }
  		end
  	end
  end
end
