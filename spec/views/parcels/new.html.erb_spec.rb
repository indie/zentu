require 'spec_helper'

describe "parcels/new" do
  before(:each) do
    assign(:parcel, stub_model(Parcel,
      :name => "MyString",
      :citizen_id => 1,
      :state => "MyString",
      :apn => "MyString",
      :legal_desc => "MyText",
      :parcel_details => "MyText",
      :acreage => 1.5,
      :maplink => "MyString",
      :zoning => "MyString",
      :deed => "MyString",
      :poa => false,
      :attachments => "MyString",
      :bid_open => "9.99"
    ).as_new_record)
  end

  it "renders new parcel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => parcels_path, :method => "post" do
      assert_select "input#parcel_name", :name => "parcel[name]"
      assert_select "input#parcel_citizen_id", :name => "parcel[citizen_id]"
      assert_select "input#parcel_state", :name => "parcel[state]"
      assert_select "input#parcel_apn", :name => "parcel[apn]"
      assert_select "textarea#parcel_legal_desc", :name => "parcel[legal_desc]"
      assert_select "textarea#parcel_parcel_details", :name => "parcel[parcel_details]"
      assert_select "input#parcel_acreage", :name => "parcel[acreage]"
      assert_select "input#parcel_maplink", :name => "parcel[maplink]"
      assert_select "input#parcel_zoning", :name => "parcel[zoning]"
      assert_select "input#parcel_deed", :name => "parcel[deed]"
      assert_select "input#parcel_poa", :name => "parcel[poa]"
      assert_select "input#parcel_attachments", :name => "parcel[attachments]"
      assert_select "input#parcel_bid_open", :name => "parcel[bid_open]"
    end
  end
end
