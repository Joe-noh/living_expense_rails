require "rails_helper"

describe ExpensesController do

  let(:expense) { FactoryGirl.create :expense }

  describe "get #index" do

    before { get :index }

    it "should respond successfully" do
      expect(response).to be_success
    end

    it "sould render index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "get #show" do

    before { get :show, id: expense.id }

    it "should respond successfully" do
      expect(response).to be_success
    end

    it "sould render show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "get #edit" do

    before { get :edit, id: expense.id }

    it "should respond successfully" do
      expect(response).to be_success
    end

    it "sould render edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "post #create" do
    it "should respond successfully" do
      post :create, expense: expense.attributes, id: expense.id
      expect(response).to redirect_to root_path
    end
  end

  describe "put #update" do
    it "should respond successfully" do
      put :update, expense: expense.attributes, id: expense.id
      expect(response).to redirect_to root_path
    end
  end

  describe "delete #destroy" do
    it "should respond successfully" do
      delete :destroy, id: expense.id
      expect(response).to redirect_to root_path
    end
  end
end
