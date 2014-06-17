require "rails_helper"

describe "view" do

  before { @expense = FactoryGirl.create(:expense) }

  describe "expenses/index" do

    before do
      3.times { FactoryGirl.create :expense }
      @expenses = Expense.all
      render template: "expenses/index"
    end

    it "should render partial 'expenses/_expense'" do
      expect(view).to render_template partial: "_expense"
    end
  end

  describe "expenses/_expense" do

    before { render partial: "expenses/expense", locals: { expense: @expense } }

    it "should render attributes of the expense" do
      expect(rendered).to include @expense.purpose
      expect(rendered).to include @expense.responsible
    end
  end

  describe "expenses/new" do

    before { render template: "expenses/new" }

    it "should render partial 'expenses/_form'" do
      expect(view).to render_template partial: "_form"
    end
  end

  describe "expenses/edit" do

    before { render template: "expenses/edit" }

    it "should render partial 'expenses/_form'" do
      expect(view).to render_template partial: "_form"
    end
  end

  describe "expenses/_form" do

    before { render partial: "expenses/form", locals: { expense: @expense } }

    it "should have several input forms" do
      expect(rendered).to include "Purpose"
      expect(rendered).to include "Responsible"
      expect(rendered).to include "Payday"

      expect(rendered.scan(/<input/).size).to be >= 4
    end
  end

  describe "expenses/show" do

    before { render template: "expenses/show" }

    it "should contain expense information" do
      expect(rendered).to include @expense.purpose
      expect(rendered).to include @expense.responsible
    end
  end
end
