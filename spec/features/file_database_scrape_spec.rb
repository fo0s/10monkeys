require 'features_helper'

feature 'Monkey features- ' do
  after(:each) { house_keeping }

  scenario 'File loaded in is saved and read from' do
    expect(load_txt_file('./lib/resource/test_file_super_easy.txt')).to be(true)
    save_txt_to_database
    expect(read_txt_from_database).to eq(['easy,1', 'super,1'])
  end

  scenario 'Words can be scraped off a site and stored in database' do
    monkey_connects_and_scrapes
    monkey_saves_cleaned_material
    expect(read_txt_from_database.length).to eq 84
  end

  scenario 'File and scraped words can be loaded into database' do
    expect(load_txt_file('./lib/resource/test_file_hard.txt')).to be(true)
    save_txt_to_database
    monkey_connects_and_scrapes
    monkey_saves_cleaned_material
    change_the_reader(:web)
    expect(read_txt_from_database.length).to eq 84
    house_keeping
    change_the_reader(:book)
    expect(read_txt_from_database.length).to eq 138
  end

  scenario 'Loaded file and scraped words can be compared' do
    expect(load_txt_file('./lib/resource/itcorp_page.txt')).to be(true)
    save_txt_to_database
    monkey_connects_and_scrapes
    monkey_saves_cleaned_material
    change_the_reader(:web)
    expect(read_txt_from_database.length).to eq 84
    house_keeping
    change_the_reader(:book)
    expect(read_txt_from_database.length).to eq 83

    # expect(monkey_status).to eq 'Finished'
  end
end
