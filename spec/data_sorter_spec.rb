# frozen_string_literal: true

require 'data_sorter'

describe 'Data sorter- ' do
  context '#load file- ' do
    it 'file has been loaded' do
      test_file = ComparativeData.new('./lib/resource/test_file_super_easy.txt')
      test_file.process_file
      expect(test_file.output).to eq [['super', 1], ['easy', 1]]
    end

    it 'can sort words' do
      test_file = ComparativeData.new('./lib/resource/test_file_easy.txt')
      test_file.process_file
      expect(test_file.output).to eq [['this', 21], ['is', 21], ['a', 21], ['test', 21]]
    end

    it 'can load a simple pdf file' do
      pdf_file = './lib/resource/dummy.pdf'
      test_file = ComparativeData.new(pdf_file)
      test_file.process_file
      expect(test_file.output).to eq [['dummy', 1], ['pdf', 1], ['file', 1]]

      # clean up
      File.delete(pdf_file + '.txt') if File.exist?(pdf_file + '.txt')
    end

    it 'can load a pdf file' do
      pdf_file = './lib/resource/sample.pdf'
      test_file = ComparativeData.new(pdf_file)
      test_file.process_file
      expect(test_file.output.reverse.first).to eq ['more', 42]

      # clean up
      File.delete(pdf_file + '.txt') if File.exist?(pdf_file + '.txt')
    end
  end
end
