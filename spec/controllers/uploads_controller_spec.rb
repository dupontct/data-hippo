require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UploadsController do

  def mock_upload(stubs={})
    @mock_upload ||= mock_model(Upload, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all uploads as @uploads" do
      Upload.should_receive(:find).with(:all).and_return([mock_upload])
      get :index
      assigns[:uploads].should == [mock_upload]
    end

    describe "with mime type of xml" do
  
      it "should render all uploads as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Upload.should_receive(:find).with(:all).and_return(uploads = mock("Array of Uploads"))
        uploads.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested upload as @upload" do
      Upload.should_receive(:find).with("37").and_return(mock_upload)
      get :show, :id => "37"
      assigns[:upload].should equal(mock_upload)
    end
    
    describe "with mime type of xml" do

      it "should render the requested upload as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Upload.should_receive(:find).with("37").and_return(mock_upload)
        mock_upload.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new upload as @upload" do
      Upload.should_receive(:new).and_return(mock_upload)
      get :new
      assigns[:upload].should equal(mock_upload)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested upload as @upload" do
      Upload.should_receive(:find).with("37").and_return(mock_upload)
      get :edit, :id => "37"
      assigns[:upload].should equal(mock_upload)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created upload as @upload" do
        Upload.should_receive(:new).with({'these' => 'params'}).and_return(mock_upload(:save => true))
        post :create, :upload => {:these => 'params'}
        assigns(:upload).should equal(mock_upload)
      end

      it "should redirect to the created upload" do
        Upload.stub!(:new).and_return(mock_upload(:save => true))
        post :create, :upload => {}
        response.should redirect_to(upload_url(mock_upload))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved upload as @upload" do
        Upload.stub!(:new).with({'these' => 'params'}).and_return(mock_upload(:save => false))
        post :create, :upload => {:these => 'params'}
        assigns(:upload).should equal(mock_upload)
      end

      it "should re-render the 'new' template" do
        Upload.stub!(:new).and_return(mock_upload(:save => false))
        post :create, :upload => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested upload" do
        Upload.should_receive(:find).with("37").and_return(mock_upload)
        mock_upload.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :upload => {:these => 'params'}
      end

      it "should expose the requested upload as @upload" do
        Upload.stub!(:find).and_return(mock_upload(:update_attributes => true))
        put :update, :id => "1"
        assigns(:upload).should equal(mock_upload)
      end

      it "should redirect to the upload" do
        Upload.stub!(:find).and_return(mock_upload(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(upload_url(mock_upload))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested upload" do
        Upload.should_receive(:find).with("37").and_return(mock_upload)
        mock_upload.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :upload => {:these => 'params'}
      end

      it "should expose the upload as @upload" do
        Upload.stub!(:find).and_return(mock_upload(:update_attributes => false))
        put :update, :id => "1"
        assigns(:upload).should equal(mock_upload)
      end

      it "should re-render the 'edit' template" do
        Upload.stub!(:find).and_return(mock_upload(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested upload" do
      Upload.should_receive(:find).with("37").and_return(mock_upload)
      mock_upload.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the uploads list" do
      Upload.stub!(:find).and_return(mock_upload(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(uploads_url)
    end

  end

end
