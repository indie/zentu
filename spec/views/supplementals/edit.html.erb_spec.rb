require 'spec_helper'

describe "supplementals/edit" do
  before(:each) do
    @supplemental = assign(:supplemental, stub_model(Supplemental))
  end

  it "renders the edit supplemental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplementals_path(@supplemental), :method => "post" do
    end
  end
end
