require 'spec_helper'

describe "supplementals/new" do
  before(:each) do
    assign(:supplemental, stub_model(Supplemental).as_new_record)
  end

  it "renders new supplemental form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplementals_path, :method => "post" do
    end
  end
end
