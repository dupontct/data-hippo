require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/downloads/show.html.erb" do
  include DownloadsHelper
  
  before(:each) do
    assigns[:download] = @download = stub_model(Download,
      :email_address => "value for email_address",
      :identity_url => "value for identity_url",
      :token => "value for token",
      :password => "value for password",
    )
  end

  it "should render attributes in <p>" do
    render "/downloads/show.html.erb"
    response.should have_text(/value\ for\ email_address/)
    response.should have_text(/value\ for\ identity_url/)
    response.should have_text(/value\ for\ token/)
    response.should have_text(/value\ for\ password/)
  end
end

