require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/uploads/show.html.erb" do
  include UploadsHelper
  
  before(:each) do
    assigns[:upload] = @upload = stub_model(Upload,
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
  end

  it "should render attributes in <p>" do
    render "/uploads/show.html.erb"
    response.should have_text(/value\ for\ email_address/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ note/)
    response.should have_text(/als/)
    response.should have_text(/value\ for\ file/)
    response.should have_text(/value\ for\ local_filename/)
    response.should have_text(/value\ for\ password/)
    response.should have_text(/value\ for\ salt/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ md5_digest/)
  end
end

