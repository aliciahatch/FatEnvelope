require 'spec_helper'

describe PagesController do

  describe "GET 'essay-system'" do
    it "returns http success" do
      get 'essay-system'
      response.should be_success
    end
  end

  describe "GET 'success-stories'" do
    it "returns http success" do
      get 'success-stories'
      response.should be_success
    end
  end

  describe "GET 'program-costs'" do
    it "returns http success" do
      get 'program-costs'
      response.should be_success
    end
  end

  describe "GET 'faq'" do
    it "returns http success" do
      get 'faq'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'advisors'" do
    it "returns http success" do
      get 'advisors'
      response.should be_success
    end
  end

  describe "GET 'tiger-moms'" do
    it "returns http success" do
      get 'tiger-moms'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

end
