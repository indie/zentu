require 'spec_helper'

describe "materials/new" do
  before(:each) do
    assign(:material, stub_model(Material,
      :name => "MyString",
      :category => "MyString",
      :description => "MyText",
      :ancestry => "MyString"
    ).as_new_record)
  end

  it "renders new material form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => materials_path, :method => "post" do
      assert_select "input#material_name", :name => "material[name]"
      assert_select "input#material_category", :name => "material[category]"
      assert_select "textarea#material_description", :name => "material[description]"
      assert_select "input#material_ancestry", :name => "material[ancestry]"
    end
  end
end
