require 'database_spreadsheet'

describe 'Database spreadsheet' do
  context '#write and read- ' do
    before(:all) do
      @data = GoogleDatabase.new
      @data.worksheet_database(:book)
    end

    after(:each) do
      @data.delete_database
    end

    it 'has access to the database' do
      @data.write_database([['test']])
      expect(@data.read_database).to eq [['test']]
    end

    it 'can change values' do
      @data.write_database([['test']])
      @data.update_database('changed', 1, 1)
      expect(@data.read_database).to eq [['changed']]
    end
  end
end
