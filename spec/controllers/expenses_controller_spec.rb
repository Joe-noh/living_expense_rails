require "rails_helper"

describe ExpensesController do

  let(:expense) { FactoryGirl.create :expense }

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
      xhr :get, :edit, id: expense.id, format: "html"
      expect(response).to be_success
    end
  end

  describe "post #create" do
    it "should respond successfully to an ajax post request" do
      xhr :post, :create, expense: expense.attributes, id: expense.id
      expect(response).to be_success
    end
  end

  describe "put #update" do
    it "should respond successfully to an ajax post request" do
      xhr :put, :update, expense: expense.attributes, id: expense.id
      expect(response).to be_success
    end
  end

  describe "delete #destroy" do
    it "should respond successfully to an ajax post request" do
      xhr :delete, :destroy, id: expense.id
      expect(response).to be_success
    end
  end
end
