require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have content 'Home'" do
      visit root_path
      page.should have_selector('title', :text => 'Home')
    end
  end
end
