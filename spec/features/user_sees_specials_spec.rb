RSpec.describe 'As a User' do
  describe 'When I visit /comedians' do
    it 'should see specials for comedians' do
      comedian_1 = Comedian.create(name: "John Mulaney", age: 36, hometown: "Chicago, IL")
      comedian_2 = Comedian.create(name: "Mitch Hedberg", age: 36, hometown: "Saint Paul, MN")
      comedian_1.specials.create(title: "Kid Gorgeous", runtime: 65, image_file: "https://m.media-amazon.com/images/M/MV5BOWZlYjE4ZDYtNjhlNi00ZGQ0LTgxZmUtNGRjNDM4YWJmOWNiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      comedian_2.specials.create(title: "Comedy Central Presents: Mitch Hedberg", runtime: 30, image_file: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHGPBMGUNy3WnCVWPyiCQxtRZ_G4KC3Cjv1JiCmsq6rM6lk3q-g")

      visit '/comedians'

      within("#special-" + "#{comedian_1.specials.first.id}") do
        expect(page).to have_content(comedian_1.specials.first.title)
        expect(page).to have_content(comedian_1.specials.first.runtime)
      end

      within("#special-" + "#{comedian_2.specials.first.id}") do
        expect(page).to have_content(comedian_2.specials.first.title)
        expect(page).to have_content(comedian_2.specials.first.runtime)
      end
    end
  end
end
