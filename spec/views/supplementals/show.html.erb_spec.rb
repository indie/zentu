require 'spec_helper'

describe "supplementals/show" do
  before(:each) do
    @supplemental = assign(:supplemental, stub_model(Supplemental))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
