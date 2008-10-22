require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/uploads/new.html.erb" do
  include UploadsHelper
  
  before(:each) do
    assigns[:upload] = stub_model(Upload,
      :new_record? => true,
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

  it "should render new form" do
    render "/uploads/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", uploads_path) do
      with_tag("input#upload_email_address[name=?]", "upload[email_address]")
      with_tag("input#upload_name[name=?]", "upload[name]")
      with_tag("input#upload_note[name=?]", "upload[note]")
      with_tag("input#upload_confirm[name=?]", "upload[confirm]")
      with_tag("input#upload_file[name=?]", "upload[file]")
      with_tag("input#upload_local_filename[name=?]", "upload[local_filename]")
      with_tag("input#upload_password[name=?]", "upload[password]")
      with_tag("input#upload_salt[name=?]", "upload[salt]")
      with_tag("input#upload_file_size[name=?]", "upload[file_size]")
      with_tag("input#upload_downloads_count[name=?]", "upload[downloads_count]")
      with_tag("input#upload_md5_digest[name=?]", "upload[md5_digest]")
    end
  end
end


