require "rails_helper"

describe RecordsController do

  let(:record) { FactoryGirl.create :record }

  describe "get #index" do
    it "should respond successfully" do
      get :index
      expect(response).to be_success
    end

    it "sould render index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "get #new" do
    it "should rensond successfully to an ajax get request" do
      xhr :get, :new, format: "html"
      expect(response).to be_success
    end
  end

  describe "get #edit" do
    it "should respond successfully to an ajax get request" do
      xhr :get, :edit, id: record.id, format: "html"
      expect(response).to be_success
    end
  end

  describe "post #create" do
    it "should respond successfully to an ajax post request" do
      xhr :post, :create, record: record.attributes, id: record.id
      expect(response).to be_success
    end
  end

  describe "put #update" do
    it "should respond successfully to an ajax post request" do
      xhr :put, :update, record: record.attributes, id: record.id
      expect(response).to be_success
    end
  end

  describe "delete #destroy" do
    it "should respond successfully to an ajax post request" do
      xhr :delete, :destroy, id: record.id
      expect(response).to be_success
    end
  end
end