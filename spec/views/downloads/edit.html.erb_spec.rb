require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/downloads/edit.html.erb" do
  include DownloadsHelper
  
  before(:each) do
    assigns[:download] = @download = stub_model(Download,
      :new_record? => false,
      :email_address => "value for email_address",
      :identity_url => "value for identity_url",
      :token => "value for token",
      :password => "value for password",
    )
  end

  it "should render edit form" do
    render "/downloads/edit.html.erb"
    
    response.should have_tag("form[action=#{download_path(@download)}][method=post]") do
      with_tag('input#download_email_address[name=?]', "download[email_address]")
      with_tag('input#download_identity_url[name=?]', "download[identity_url]")
      with_tag('input#download_token[name=?]', "download[token]")
      with_tag('input#download_password[name=?]', "download[password]")
    end
  end
end


