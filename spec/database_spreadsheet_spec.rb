require 'database_spreadsheet'

describe "Database spreadsheet" do

    context "#write and read- " do

        it "has access to the database" do
            data = GoogleDatabase.new
            expect(data.read_database).to eq [["this ", "is", "a", "test"], ["djsalk", "khjk", "", ""], ["dsa", "ewr", "", ""], ["dsa", "gfd", "", ""], ["fd", "gfd", "", ""]] 

        end
    end
end