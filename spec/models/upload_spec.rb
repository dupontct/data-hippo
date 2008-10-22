require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Upload do
  before(:each) do
    @valid_attributes = {
      :email_address => "value for email_address",
      :name => "value for name",
      :note => "value for note",
      :confirm => false,
      :file => "value for file",
      :local_filename => "value for local_filename",
      :expire_date => Time.now,
      :password => "value for password",
      :salt => "value for salt",
      :file_size => "1",
      :downloads_count => "1",
      :md5_digest => "value for md5_digest"
    }
  end

  it "should create a new instance given valid attributes" do
    Upload.create!(@valid_attributes)
  end
end
