require 'rails_helper'

RSpec.describe "wages/index", type: :view do
  before(:each) do
    assign(:wages, [
      Wage.create!(
        :hourly_rate => 2
      ),
      Wage.create!(
        :hourly_rate => 2
      )
    ])
  end

  it "renders a list of wages" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
