require 'data_sorter'

describe 'Data sorter- ' do
  context '#load file- ' do
    it 'file has been loaded' do
      test_file = ComparativeData.new("./lib/resource/test_file_super_easy.txt")
      test_file.process_file
      expect(test_file.output).to eq [["Super", 1],["Easy", 1]]
    end

    it 'can sort words' do
      test_file = ComparativeData.new("./lib/resource/test_file_easy.txt")
      test_file.process_file
      expect(test_file.output).to eq [["This", 21], ["is", 21], ["a", 21], ["test.", 21]]
    end
  end
end
