module LdapHelper
  def username_list
    params = Rails.application.secrets.ldap.symbolize_keys
    params[:auth].symbolize_keys!

    ldap = Net::LDAP.new params
    ldap.open do |agent|
      agent.search.collect { |entry|
        entry[params[:name_attr]].first
      }.compact
    end
  end
end
