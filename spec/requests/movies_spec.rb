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

end



