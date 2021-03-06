require 'spec_helper'

describe UsersController do
  integrate_views

  describe "GET 'new'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the correct title" do
      get 'new'
      response.should have_tag("title", APP_NAME + " - Sign Up")
    end

  end
end
