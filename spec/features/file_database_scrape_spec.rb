require "features_helper"

feature "Monkey features- " do

    scenario "File loaded in is saved and read from" do
        expect(load_txt_file('./lib/resource/test_file_super_easy.txt')).to be(true)
        save_txt_to_database
        expect(read_txt_from_database).to eq(["Easy,1", "Super,1"])
        house_keeping
    end

    scenario "Words can be scraped off a site and stored in database" do
        monkey_connects_and_scrapes
        monkey_saves_cleaned_material
        expect(read_txt_from_database.length).to eq 84
        house_keeping
    end

    scenario "File and scraped words can be loaded into database" do
        expect(load_txt_file('./lib/resource/test_file_hard.txt')).to be(true)
        save_txt_to_database
        monkey_connects_and_scrapes
        monkey_saves_cleaned_material
        change_the_reader(:web)
        expect(read_txt_from_database.length).to eq 84
        change_the_reader(:book)
        expect(read_txt_from_database.length).to eq 176
        house_keeping
    end
end

