require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Download do
  before(:each) do
    @valid_attributes = {
      :upload_id => "1",
      :email_address => "value for email_address",
      :identity_url => "value for identity_url",
      :token => "value for token",
      :password => "value for password",
      :created_on => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Download.create!(@valid_attributes)
  end
end
