require 'rails_helper'

RSpec.describe LdapHelper, :type => :helper do
  it 'fetch LDAP users list' do
    list = helper.username_list
    expect(list.size).to be >= 10
    expect(list).to include 'jhonzawa'
  end
end
