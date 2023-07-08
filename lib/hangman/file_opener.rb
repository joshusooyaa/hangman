require_relative('./game')

def random_word
  path = File.expand_path('../../data/words.txt', __dir__)
  File.readlines(path).sample.chomp.split('')
end

def load_save(file_name)
  path = File.expand_path("../../saved/#{file_name}", __dir__)
  YAML.load_file(path, permitted_classes: [Game])
end

def saved_files
  path = File.expand_path('../../saved', __dir__)
  Dir.entries(path).select { |entry| File.file?(File.join(path, entry)) }
end
