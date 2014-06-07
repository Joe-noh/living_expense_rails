require "rails_helper"

describe "routing" do

  before(:all)do
    rec = Record.new(purpose: "Party", responsible: "jhonzawa",
                     payday: Date.today, in_out: :outgoing)
    rec.items.build(name: "beef", count: 3, unit_price: 50)
    rec.save
  end

  it "should route / to record#index" do
    expect(get: "/").to route_to(controller: "records", action: "index")
  end

  it "should route /records/:id to record#show or record#update" do
    expect(get:    "/records/1").to route_to(controller: "records",
                                             action:     "show",
                                             id:         "1")
    expect(put:    "/records/1").to route_to(controller: "records",
                                             action:     "update",
                                             id:         "1")
    expect(delete: "/records/1").to route_to(controller: "records",
                                             action:     "destroy",
                                             id:         "1")
  end

  it "should route /records/:id/edit to record#edit" do
    expect(get: "/records/1/edit").to route_to(controller: "records",
                                               action:     "edit",
                                               id:         "1")
  end

  it "should route /records to records#create for only POST" do
    expect(post: "/records").to route_to(controller: "records",
                                         action:     "create")
    expect(get:  "/records").not_to be_routable
  end

  it "should route /records/new to records#new" do
    expect(get: "/records/new").to route_to(controller: "records",
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