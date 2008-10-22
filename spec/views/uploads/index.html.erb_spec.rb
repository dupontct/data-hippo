require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/uploads/index.html.erb" do
  include UploadsHelper
  
  before(:each) do
    assigns[:uploads] = [
      stub_model(Upload,
        :email_address => "value for email_address",
        :name => "value for name",
        :note => "value for note",
        :confirm => false,
        :file => "value for file",
        :local_filename => "value for local_filename",
        :password => "value for password",
        :salt => "value for salt",
        :file_size => "1",
        :downloads_count => "1",
        :md5_digest => "value for md5_digest"
      ),
      stub_model(Upload,
        :email_address => "value for email_address",
        :name => "value for name",
        :note => "value for note",
        :confirm => false,
        :file => "value for file",
        :local_filename => "value for local_filename",
        :password => "value for password",
        :salt => "value for salt",
        :file_size => "1",
        :downloads_count => "1",
        :md5_digest => "value for md5_digest"
      )
    ]
  end

  it "should render list of uploads" do
    render "/uploads/index.html.erb"
    response.should have_tag("tr>td", "value for email_address", 2)
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for note", 2)
    response.should have_tag("tr>td", false, 2)
    response.should have_tag("tr>td", "value for file", 2)
    response.should have_tag("tr>td", "value for local_filename", 2)
    response.should have_tag("tr>td", "value for password", 2)
    response.should have_tag("tr>td", "value for salt", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for md5_digest", 2)
  end
end

