require "rails_helper"

describe "view" do

  let(:record) { FactoryGirl.create :record }

  describe "records/index" do

    before do
      3.times { FactoryGirl.create :record }
      @records = Record.all
      render template: "records/index"
    end

    it "should have title" do
      expect(rendered).to include "Living Expenses"
    end

    it "should render partial 'records/_record'" do
      expect(view).to render_template partial: "_record"
    end
  end

  describe "records/_record" do

    before { render partial: "records/record", locals: { record: record } }

    it "should render attributes of the record" do
      expect(rendered).to include record.purpose
      expect(rendered).to include record.responsible
    end
  end

  describe "records/new" do

    before { render template: "records/new", locals: { record: record } }

    it "should render partial 'records/_form'" do
      expect(view).to render_template partial: "_form"
    end
  end

  describe "records/edit" do

    before { render template: "records/edit", locals: { record: record } }

    it "should render partial 'records/_form'" do
      expect(view).to render_template partial: "_form"
    end
  end

  describe "records/_form" do

    before { render partial: "records/form", locals: { record: record } }

    it "should have several input forms" do
      expect(rendered).to include "Purpose"
      expect(rendered).to include "Responsible"
      expect(rendered).to include "Payday"

      expect(rendered.scan(/<input/).size).to be >= 4
    end
  end

  describe "records/show" do

    before { render template: "records/show", locals: { record: record } }

    it "should render partial 'items/_item'" do
      expect(view).to render_template partial: "items/_item"
    end
  end
end
