require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/downloads/index.html.erb" do
  include DownloadsHelper
  
  before(:each) do
    assigns[:downloads] = [
      stub_model(Download,
        :email_address => "value for email_address",
        :identity_url => "value for identity_url",
        :token => "value for token",
        :password => "value for password",
      ),
      stub_model(Download,
        :email_address => "value for email_address",
        :identity_url => "value for identity_url",
        :token => "value for token",
        :password => "value for password",
      )
    ]
  end

  it "should render list of downloads" do
    render "/downloads/index.html.erb"
    response.should have_tag("tr>td", "value for email_address", 2)
    response.should have_tag("tr>td", "value for identity_url", 2)
    response.should have_tag("tr>td", "value for token", 2)
    response.should have_tag("tr>td", "value for password", 2)
  end
end

