require 'google_drive'

# Google sheets database interaction
class GoogleDatabase
  def initialize
    # Find the json file
    client_secret = Dir.glob('database/*.json').join('')
    # Authenticate a session with your Service Account
    session = GoogleDrive::Session.from_service_account_key(client_secret)
    # Get the spreadsheet by its title
    spreadsheet = session.spreadsheet_by_title('Monkey Database')
    # Get the first worksheet
    @worksheet = spreadsheet.worksheets.first
  end

  def read_database
    # Print out the first 3 columns of each row
    @worksheet.rows.each { |row| puts row.first(3).join(',') }
  end

  def write_database(input)
    # Insert into specific row
    @worksheet.insert_rows(1, input)
    save_worksheet
  end

  def update_database(input, row, col)
    # Update targeted cell. This could also be "A2"
    @worksheet[row, col] = input
    save_worksheet
  end

  def delete_database
    # Deletes a row
    @worksheet.delete_rows(1, 1)
    save_worksheet
  end

  # def update_whole_database(file)
  #   @worksheet.update_from_file('./path_to_file.csv')
  #   save_worksheet
  # end

  # def export_whole_database
  #   @worksheet.export_as_string('./path_to_save, format = csv')
  #   save_worksheet
  # end

  def save_worksheet
    @worksheet.save
  end
end
