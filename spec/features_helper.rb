require 'data_sorter'
require 'database_spreadsheet'
require 'monkey_crawler'
require 'monkey_scraper'

def load_txt_file(text_file)
  @feature_file = ComparativeData.new(text_file)
  @feature_file.process_file
end

def save_txt_to_database
  @feature_database = GoogleDatabase.new
  @feature_database.worksheet_database(:book)
  @feature_database.write_database(@feature_file.output.reverse)
end

def read_txt_from_database
  @feature_database.read_database
  @feature_database.google_database
end

def house_keeping
  @feature_database.delete_whole_database
end

def monkey_connects_and_scrapes
  @feature_monkey = MonkeyScrapper.new
  @feature_monkey.monkey_scraper('http://itcorp.com/')
end

def monkey_saves_cleaned_material
  @feature_database = GoogleDatabase.new
  @feature_database.worksheet_database(:web)
  @feature_database.write_database(@feature_monkey.result)
end

def change_the_reader(feature_input)
  case feature_input
  when :book
    @feature_database.worksheet_database(:book)
  when :web
    @feature_database.worksheet_database(:web)
  end
end
