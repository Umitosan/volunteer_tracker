require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new volunteer', {:type => :feature}) do
  it('allows a user to input a volunteer name and add it to the list') do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    expect(page).to(have_content('Frankie'))
  end
end

describe('adding a new project', {:type => :feature}) do
  it('allows a user to input a project name and add it to the list') do
    visit('/')
    click_link('view/add projects')
    fill_in('title', :with =>'neighborhood blood-drive')
    click_button('Add Project')
    expect(page).to(have_content('neighborhood blood-drive'))
  end
end

describe('view volunteer status', {:type => :feature}) do
  it("allows a user to click a link to view a single volunteer's name") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    click_link('Frankie')
    expect(page).to(have_content('Frankie'))
  end
  it("allows a user to click a link to view a single volunteer's project") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    click_link('Frankie')
    expect(page).to(have_content(nil))
  end
end
