require 'spec_helper'

describe "parcels/index" do
  before(:each) do
    assign(:parcels, [
      stub_model(Parcel,
        :name => "Name",
        :citizen_id => 1,
        :state => "State",
        :apn => "Apn",
        :legal_desc => "MyText",
        :parcel_details => "MyText",
        :acreage => 1.5,
        :maplink => "Maplink",
        :zoning => "Zoning",
        :deed => "Deed",
        :poa => false,
        :attachments => "Attachments",
        :bid_open => "9.99"
      ),
      stub_model(Parcel,
        :name => "Name",
        :citizen_id => 1,
        :state => "State",
        :apn => "Apn",
        :legal_desc => "MyText",
        :parcel_details => "MyText",
        :acreage => 1.5,
        :maplink => "Maplink",
        :zoning => "Zoning",
        :deed => "Deed",
        :poa => false,
        :attachments => "Attachments",
        :bid_open => "9.99"
      )
    ])
  end

  it "renders a list of parcels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Apn".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Maplink".to_s, :count => 2
    assert_select "tr>td", :text => "Zoning".to_s, :count => 2
    assert_select "tr>td", :text => "Deed".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Attachments".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
