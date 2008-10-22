require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UploadsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "uploads", :action => "index").should == "/uploads"
    end
  
    it "should map #new" do
      route_for(:controller => "uploads", :action => "new").should == "/uploads/new"
    end
  
    it "should map #show" do
      route_for(:controller => "uploads", :action => "show", :id => 1).should == "/uploads/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "uploads", :action => "edit", :id => 1).should == "/uploads/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "uploads", :action => "update", :id => 1).should == "/uploads/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "uploads", :action => "destroy", :id => 1).should == "/uploads/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/uploads").should == {:controller => "uploads", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/uploads/new").should == {:controller => "uploads", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/uploads").should == {:controller => "uploads", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/uploads/1").should == {:controller => "uploads", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/uploads/1/edit").should == {:controller => "uploads", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/uploads/1").should == {:controller => "uploads", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/uploads/1").should == {:controller => "uploads", :action => "destroy", :id => "1"}
    end
  end
end
