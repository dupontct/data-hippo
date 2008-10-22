require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DownloadsController do

  def mock_download(stubs={})
    @mock_download ||= mock_model(Download, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all downloads as @downloads" do
      Download.should_receive(:find).with(:all).and_return([mock_download])
      get :index
      assigns[:downloads].should == [mock_download]
    end

    describe "with mime type of xml" do
  
      it "should render all downloads as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Download.should_receive(:find).with(:all).and_return(downloads = mock("Array of Downloads"))
        downloads.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested download as @download" do
      Download.should_receive(:find).with("37").and_return(mock_download)
      get :show, :id => "37"
      assigns[:download].should equal(mock_download)
    end
    
    describe "with mime type of xml" do

      it "should render the requested download as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Download.should_receive(:find).with("37").and_return(mock_download)
        mock_download.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new download as @download" do
      Download.should_receive(:new).and_return(mock_download)
      get :new
      assigns[:download].should equal(mock_download)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested download as @download" do
      Download.should_receive(:find).with("37").and_return(mock_download)
      get :edit, :id => "37"
      assigns[:download].should equal(mock_download)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created download as @download" do
        Download.should_receive(:new).with({'these' => 'params'}).and_return(mock_download(:save => true))
        post :create, :download => {:these => 'params'}
        assigns(:download).should equal(mock_download)
      end

      it "should redirect to the created download" do
        Download.stub!(:new).and_return(mock_download(:save => true))
        post :create, :download => {}
        response.should redirect_to(download_url(mock_download))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved download as @download" do
        Download.stub!(:new).with({'these' => 'params'}).and_return(mock_download(:save => false))
        post :create, :download => {:these => 'params'}
        assigns(:download).should equal(mock_download)
      end

      it "should re-render the 'new' template" do
        Download.stub!(:new).and_return(mock_download(:save => false))
        post :create, :download => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested download" do
        Download.should_receive(:find).with("37").and_return(mock_download)
        mock_download.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :download => {:these => 'params'}
      end

      it "should expose the requested download as @download" do
        Download.stub!(:find).and_return(mock_download(:update_attributes => true))
        put :update, :id => "1"
        assigns(:download).should equal(mock_download)
      end

      it "should redirect to the download" do
        Download.stub!(:find).and_return(mock_download(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(download_url(mock_download))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested download" do
        Download.should_receive(:find).with("37").and_return(mock_download)
        mock_download.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :download => {:these => 'params'}
      end

      it "should expose the download as @download" do
        Download.stub!(:find).and_return(mock_download(:update_attributes => false))
        put :update, :id => "1"
        assigns(:download).should equal(mock_download)
      end

      it "should re-render the 'edit' template" do
        Download.stub!(:find).and_return(mock_download(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested download" do
      Download.should_receive(:find).with("37").and_return(mock_download)
      mock_download.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the downloads list" do
      Download.stub!(:find).and_return(mock_download(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(downloads_url)
    end

  end

end
