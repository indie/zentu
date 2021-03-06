require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ParcelsController do

  # This should return the minimal set of attributes required to create a valid
  # Parcel. As you add validations to Parcel, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ParcelsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all parcels as @parcels" do
      parcel = Parcel.create! valid_attributes
      get :index, {}, valid_session
      assigns(:parcels).should eq([parcel])
    end
  end

  describe "GET show" do
    it "assigns the requested parcel as @parcel" do
      parcel = Parcel.create! valid_attributes
      get :show, {:id => parcel.to_param}, valid_session
      assigns(:parcel).should eq(parcel)
    end
  end

  describe "GET new" do
    it "assigns a new parcel as @parcel" do
      get :new, {}, valid_session
      assigns(:parcel).should be_a_new(Parcel)
    end
  end

  describe "GET edit" do
    it "assigns the requested parcel as @parcel" do
      parcel = Parcel.create! valid_attributes
      get :edit, {:id => parcel.to_param}, valid_session
      assigns(:parcel).should eq(parcel)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Parcel" do
        expect {
          post :create, {:parcel => valid_attributes}, valid_session
        }.to change(Parcel, :count).by(1)
      end

      it "assigns a newly created parcel as @parcel" do
        post :create, {:parcel => valid_attributes}, valid_session
        assigns(:parcel).should be_a(Parcel)
        assigns(:parcel).should be_persisted
      end

      it "redirects to the created parcel" do
        post :create, {:parcel => valid_attributes}, valid_session
        response.should redirect_to(Parcel.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved parcel as @parcel" do
        # Trigger the behavior that occurs when invalid params are submitted
        Parcel.any_instance.stub(:save).and_return(false)
        post :create, {:parcel => {}}, valid_session
        assigns(:parcel).should be_a_new(Parcel)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Parcel.any_instance.stub(:save).and_return(false)
        post :create, {:parcel => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested parcel" do
        parcel = Parcel.create! valid_attributes
        # Assuming there are no other parcels in the database, this
        # specifies that the Parcel created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Parcel.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => parcel.to_param, :parcel => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested parcel as @parcel" do
        parcel = Parcel.create! valid_attributes
        put :update, {:id => parcel.to_param, :parcel => valid_attributes}, valid_session
        assigns(:parcel).should eq(parcel)
      end

      it "redirects to the parcel" do
        parcel = Parcel.create! valid_attributes
        put :update, {:id => parcel.to_param, :parcel => valid_attributes}, valid_session
        response.should redirect_to(parcel)
      end
    end

    describe "with invalid params" do
      it "assigns the parcel as @parcel" do
        parcel = Parcel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Parcel.any_instance.stub(:save).and_return(false)
        put :update, {:id => parcel.to_param, :parcel => {}}, valid_session
        assigns(:parcel).should eq(parcel)
      end

      it "re-renders the 'edit' template" do
        parcel = Parcel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Parcel.any_instance.stub(:save).and_return(false)
        put :update, {:id => parcel.to_param, :parcel => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested parcel" do
      parcel = Parcel.create! valid_attributes
      expect {
        delete :destroy, {:id => parcel.to_param}, valid_session
      }.to change(Parcel, :count).by(-1)
    end

    it "redirects to the parcels list" do
      parcel = Parcel.create! valid_attributes
      delete :destroy, {:id => parcel.to_param}, valid_session
      response.should redirect_to(parcels_url)
    end
  end

end
