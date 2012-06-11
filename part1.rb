def palindrome?(string)
  string = string.gsub(/\W+/, '').downcase
  string == string.reverse
end

def count_words(string)
  array = string.downcase.split(/\W+/).
          select { |elt| elt =~ /\w+/ }
  hash = Hash.new
  array.each do |elt|
    if hash.has_key? elt
      hash[elt] += 1
    else
      hash[elt] = 1
    end
  end
  hash
end
