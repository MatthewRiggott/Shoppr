require 'rails_helper'

feature 'supplies index' do
  let!(:group) { FactoryGirl.create(:group)}
  let!(:grocery_list) { FactoryGirl.create(:grocery_list, group_id: group.id) }
  let!(:supply) { FactoryGirl.create(:supply, grocery_list_id: grocery_list.id) }
  scenario 'view supplies!' do
    visit root_path
    click_on "#{group.name}"
    expect(page).to have_content("#{grocery_list.name}")
    expect(page).to have_content("#{supply.item}")
  end
end