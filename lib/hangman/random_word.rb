def random_word
  path = File.expand_path('../../data/words.txt', __dir__)
  word = File.readlines(path).sample
end