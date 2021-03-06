require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name",
      :description => "MyText",
      :image => "Image",
      :city => "City",
      :state => "State",
      :telephone => "Telephone",
      :website => "Website",
      :citizen_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Telephone/)
    rendered.should match(/Website/)
    rendered.should match(/1/)
  end
end
