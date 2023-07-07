def random_word
  path = File.expand_path('../../data/words.txt', __dir__)
  File.readlines(path).sample.chomp.split('')
end
