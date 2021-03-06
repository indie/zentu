require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :name => "MyString",
      :description => "MyText",
      :image => "MyString",
      :city => "MyString",
      :state => "MyString",
      :telephone => "MyString",
      :website => "MyString",
      :citizen_id => 1
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path, :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
      assert_select "textarea#company_description", :name => "company[description]"
      assert_select "input#company_image", :name => "company[image]"
      assert_select "input#company_city", :name => "company[city]"
      assert_select "input#company_state", :name => "company[state]"
      assert_select "input#company_telephone", :name => "company[telephone]"
      assert_select "input#company_website", :name => "company[website]"
      assert_select "input#company_citizen_id", :name => "company[citizen_id]"
    end
  end
end
