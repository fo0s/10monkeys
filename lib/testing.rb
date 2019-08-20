# frozen_string_literal: true

require_relative 'database_spreadsheet'
require 'pp'

data = GoogleDatabase.new
pp data.read_database
