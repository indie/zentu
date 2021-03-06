require 'spec_helper'

describe "supplementals/index" do
  before(:each) do
    assign(:supplementals, [
      stub_model(Supplemental),
      stub_model(Supplemental)
    ])
  end

  it "renders a list of supplementals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
