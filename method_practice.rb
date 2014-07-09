# Ruby functions

###########################

# tell whether a string has all unique characters 

def uniq_chars?(string)
  chars = {}
  string.each_char do |char|
    return false if chars[char]
    chars[char] = true
  end

  true
end

# remove duplicates in a string, O(n) time

def remove_dups(string)
  result = []
  hash = {}
  string.each_char do |char|
    result << char unless hash[char]
    hash[char] = true
  end
  result.join
end

# Implement a function with signature find_chars(string1, string2) that takes two strings and returns a string that contains only the characters found in string1 and string two in the order that they are found in string1. Implement a version of order N*N and one of order N.


def find_chars(string1, string2)
  
  hash = {}
  string1.split(//).each_with_index do |char, idx| 
    hash[char] = idx
  end
  result = []
  string2.each_char do |char|
    if hash[char] 
      result << [char, hash[char]]
    end
  end
    
  result.sort_by{|el| el[1]}.map{|el| el[0]}
end

# write a function that takes an integer and returns the next integer that is a palindrome

def palindrome?(num)
  str = num.to_s
  i = 0
  until i == (str.length / 2)
    return false unless str[i] == str[str.length - 1 - i]
    i+=1
  end
  true
end

def next_palindrome(num)
  while true do
    num+=1
    return num if palindrome?(num)
  end  
end

dir = {
  'a' => {
    'b' => {
      'c' => {
        'd' => {
          'e' => true
        },

        'f' => true
      }
    }
  }
}


# write a function that returns all file paths given a hash directory (see above)
# file_list(files) # => ['a/b/c/d/e', 'a/b/c/f']

def file_paths(dir)
  paths = []
  
  dir.each do |key, val|
    
    if val.is_a?(Hash)
      
      nested_files = file_paths(val)
      nested_files.each { |file| paths << "#{key}/#{file}" }
    else
      
      paths << key
      
    end
  end
  
  paths
end

# write a sqrt function using only simple arithmetic, assume the input is a perfect square 

def sqrt(num, candidates = nil)
  
  candidates ||= (1..num/2).to_a
  
  return -1 if candidates.length == 0

  mid_idx = candidates.length / 2
  mid = candidates[mid_idx] 
  
  return mid if (mid * mid == num)
  
  if mid * mid > num 
    return sqrt(num, candidates[0...mid_idx])
  else
    return sqrt(num, candidates[mid_idx+1..-1])
  end
  
end

# Write a function that returns a number between 1 and 7 given a rand(5) function

def rand_seven
  success = false
  until success
    try = (5 * Random.rand(5)) + Random.rand(5)
    success = try % 7 unless try > 21
  end
  success
end

# do stock picker in linear time
# arr = [56, 35, 47, 63, 31, 55]

def stock_picker(arr)
  
  min = arr[0]
  low = arr[0]
  high = arr[1]
  biggest_diff = high - low
  
  
  arr.each_with_index do |el, idx|
    
    min = el if el < min
    
    if el - min > biggest_diff
      high = el 
      low = min
      biggest_diff = high - low
    end
    p biggest_diff
    
  end
  [low, high]
end