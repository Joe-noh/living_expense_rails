require "rails_helper"

describe "routing" do

  before(:all)do
    rec = Expense.new(purpose: "Party", responsible: "jhonzawa",
                      payday: Date.today, in_out: :outgoing)
    rec.items.build(name: "beef", count: 3, unit_price: 50)
    rec.save
  end

  it "should route / to expense#index" do
    expect(get: "/").to route_to(controller: "expenses", action: "index")
  end

  it "should route /expenses/:id to expense#show or expense#update" do
    expect(get:    "/expenses/1").to route_to(controller: "expenses",
                                              action:     "show",
                                              id:         "1")
    expect(put:    "/expenses/1").to route_to(controller: "expenses",
                                              action:     "update",
                                              id:         "1")
    expect(delete: "/expenses/1").to route_to(controller: "expenses",
                                              action:     "destroy",
                                              id:         "1")
  end

  it "should route /expenses/:id/edit to expense#edit" do
    expect(get: "/expenses/1/edit").to route_to(controller: "expenses",
                                                action:     "edit",
                                                id:         "1")
  end

  it "should route /expenses to expenses#create for only POST" do
    expect(post: "/expenses").to route_to(controller: "expenses",
                                          action:     "create")
    expect(get:  "/expenses").not_to be_routable
  end

  it "should route /expenses/new to expenses#new" do
    expect(get: "/expenses/new").to route_to(controller: "expenses",
                                             action:     "new")
  end

  it "should not route to items" do
    expect(get:  "/items"       ).not_to be_routable
    expect(get:  "/items/1"     ).not_to be_routable
    expect(get:  "/items/new"   ).not_to be_routable
    expect(get:  "/items/1/edit").not_to be_routable
    expect(post: "/items"       ).not_to be_routable
    expect(post: "/items/1"     ).not_to be_routable
  end
end
