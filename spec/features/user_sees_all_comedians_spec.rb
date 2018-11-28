RSpec.describe 'As a user' do
  describe 'When I visit /comedians' do
    it 'I see a list of comedians' do
      comedian_1 = Comedian.create(name: "John Mulaney", age: 36, hometown: "Chicago, IL")
      comedian_2 = Comedian.create(name: "Mitch Hedberg", age: 36, hometown: "Saint Paul, MN")

      visit '/comedians'

      save_and_open_page

      within("#comedian-" + "#{comedian_1.id}") do
        expect(page).to have_content("Name: #{comedian_1.name}")
        expect(page).to have_content("Age: #{comedian_1.age}")
        expect(page).to have_content("Hometown: #{comedian_1.hometown}")
      end

      within("#comedian-#{comedian_2.id}") do
        expect(page).to have_content("Name: #{comedian_2.name}")
        expect(page).to have_content("Age: #{comedian_2.age}")
        expect(page).to have_content("Hometown: #{comedian_2.hometown}")
      end
    end
  end
end
