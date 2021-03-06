require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :name => "Name",
        :description => "MyText",
        :image => "Image",
        :city => "City",
        :state => "State",
        :telephone => "Telephone",
        :website => "Website",
        :citizen_id => 1
      ),
      stub_model(Company,
        :name => "Name",
        :description => "MyText",
        :image => "Image",
        :city => "City",
        :state => "State",
        :telephone => "Telephone",
        :website => "Website",
        :citizen_id => 1
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
