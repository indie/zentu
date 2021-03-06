require 'spec_helper'

describe "materials/edit" do
  before(:each) do
    @material = assign(:material, stub_model(Material,
      :name => "MyString",
      :category => "MyString",
      :description => "MyText",
      :ancestry => "MyString"
    ))
  end

  it "renders the edit material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => materials_path(@material), :method => "post" do
      assert_select "input#material_name", :name => "material[name]"
      assert_select "input#material_category", :name => "material[category]"
      assert_select "textarea#material_description", :name => "material[description]"
      assert_select "input#material_ancestry", :name => "material[ancestry]"
    end
  end
end
