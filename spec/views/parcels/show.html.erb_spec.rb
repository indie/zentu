require 'spec_helper'

describe "parcels/show" do
  before(:each) do
    @parcel = assign(:parcel, stub_model(Parcel,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/State/)
    rendered.should match(/Apn/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
    rendered.should match(/Maplink/)
    rendered.should match(/Zoning/)
    rendered.should match(/Deed/)
    rendered.should match(/false/)
    rendered.should match(/Attachments/)
    rendered.should match(/9.99/)
  end
end
