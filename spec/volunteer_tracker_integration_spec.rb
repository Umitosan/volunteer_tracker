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
    click_button('Add project')
    expect(page).to(have_content('neighborhood blood-drive'))
  end
end

describe('view volunteer status page', {:type => :feature}) do
  it("allows a user to click a link to view a single volunteer's name") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    click_link('Frankie')
    expect(page).to(have_content('Frankie'))
  end
  it("displys a message if the volunteer has no project assigned yet") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    click_link('Frankie')
    expect(page).to(have_content("doesn't have a project yet"))
  end
  it("displays the project project for the selected user on the page") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    click_link('Frankie')
    click_link('Return Home')
    click_link('view/add projects')
    fill_in('title', :with =>'soup kitchen')
    click_button('Add project')
    click_link('Home')
    click_link('view/add volunteers')
    click_link('Frankie')
    choose('soup kitchen')
    click_button('update')
    expect(page).to(have_content("soup kitchen"))
  end
end

describe('view project status page', {:type => :feature}) do
  it("allows a user to click a link to view a single project's name") do
    visit('/')
    click_link('view/add projects')
    fill_in('title', :with =>'neighborhood blood-drive')
    click_button('Add project')
    click_link('neighborhood blood-drive')
    expect(page).to(have_content('neighborhood blood-drive'))
  end
  it("allows a user to click a link to view all the volunteers for a project") do
    visit('/')
    click_link('view/add projects')
    fill_in('title', :with =>'neighborhood blood-drive')
    click_button('Add project')
    click_link('neighborhood blood-drive')
    expect(page).to(have_content("doesn't have any volunteers yet"))
  end
end

describe('delete volunteer', {:type => :feature}) do
  it("allows a user to delete a volunteer from the database using a button") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with =>'Frankie')
    click_button('Add volunteer')
    click_link('Frankie')
    click_button('Remove Volunteer')
    expect(page).not_to(have_content('Frankie'))
  end
end

describe('delete project', {:type => :feature}) do
  it("allows a user to delete a project from the database using a button") do
    visit('/')
    click_link('view/add projects')
    fill_in('title', :with => 'neighborhood blood-drive')
    click_button('Add project')
    click_link('neighborhood blood-drive')
    click_button('Remove Project')
    expect(page).not_to(have_content('neighborhood blood-drive'))
  end
end

describe('rename project', {:type => :feature}) do
  it("allows a user to rename a project") do
    visit('/')
    click_link('view/add projects')
    fill_in('title', :with => 'neighborhood blood-drive')
    click_button('Add project')
    click_link('neighborhood blood-drive')
    fill_in('new_title', :with => 'litter patrol')
    click_button('Save')
    expect(page).to(have_content('litter patrol'))
  end
end

describe('rename volunteer', {:type => :feature}) do
  it("allows a user to rename a volunteer") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with => 'Jackie')
    click_button('Add volunteer')
    click_link('Jackie')
    fill_in('new_name', :with => 'Margret')
    click_button('Save')
    expect(page).to(have_content('Margret'))
  end
end

describe('updating project', {:type => :feature}) do
  it("allows a user to add multiple volunteers to a project") do
    visit('/')
    click_link('view/add volunteers')
    fill_in('name', :with => 'Jackie')
    click_button('Add volunteer')
    click_link('Return Home')
    click_link('view/add projects')
    fill_in('title', :with => 'litter patrol')
    click_button('Add project')
    click_link('litter patrol')
    page.check('Jackie')
    click_button('Add Volunteers')
    expect(page.find('div', :class => 'green_text').text).to(eq('Jackie'))
  end
end
