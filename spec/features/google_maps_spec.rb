describe "Google Maps" do
  before :each do
    @user = FactoryGirl.create(:user)
    login_as @user, scope: :user
    @experience = Experience.new(id: 1337, primary_contact_name: "John Doe", latitude: 40.722002, longitude: -73.992991, user_id: 1)
    @experience.build_donation(donatable_id: 1337, donatable_type: "Experience", title: "Bowery Mission", description: "Homeless Shelter", user_id: 1)
    @experience.save
  end

  it "should render an existing location" do
    visit user_donations_path(@user)
    expect(page).to have_content("Bowery Mission")
    expect(page).to have_css("div#map-canvas")
  end
end