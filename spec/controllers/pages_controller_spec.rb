require 'spec_helper'

describe PagesController do
  integrate_views

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the correct title" do
      get 'about'
      response.should have_tag("title", APP_NAME + " - About")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the correct title" do
      get 'contact'
      response.should have_tag("title", APP_NAME + " - Contact")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "should have the correct title" do
      get 'help'
      response.should have_tag("title", APP_NAME + " - Help")
    end
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the correct title" do
      get 'home'
      response.should have_tag("title", APP_NAME + " - Home")
    end
  end
end
