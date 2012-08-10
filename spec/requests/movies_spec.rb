require 'spec_helper'

describe "Movies" do
  describe "GET /movies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get movies_path
      response.status.should be(200)
    end
  end
	
  describe "Home page" do
	it "should have the content 'All Movies'" do
		visit '/movies/new'
		page.should have_content('Create New Movie')
	end
  end

  describe "Help page" do
	it "should have the h1 'Help'" do
		visit '/help/help'
		page.should have_selector('h1', :text => 'Help')
	end

	it "should have the title 'Help'" do
		visit '/help/help'
		page.should have_selector('title',	:text => "Ruby on Rails Tutorial Sample App | Help")
	end
  end
	
  describe "About page" do
	it "should have the h1 'About Us'" do
		visit '/help/about'
		page.should have_selector('h1', :text => 'About Us')
	end

	it "should have the title 'About Us'" do
		visit '/help/about'
		page.should have_selector('title',	:text => "Ruby on Rails Tutorial Sample App | About Us")
	end
 end


end



