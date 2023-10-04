require 'pry-byebug'

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n - 1)
  end
end

def bottles(n)
  if n == 0
    puts 'no more bottles of beer on the wall'
  else
    puts "#{n} bottles of beer on the wall"
    bottles(n - 1)
  end
end

def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def flatten(array, new_array = [])
  array.length.times do |i|
    if array.empty?
      0
    elsif array[i].is_a?(Integer)
      new_array << array[i]
    elsif array[i].is_a?(Array)
      flatten(array[i], new_array)
    end
  end
  p new_array
end

def fibs(number)
  fib_array = []
  n = 0
  number.times do
    if n < 2
      fib_array[n] = n
    else
      fib_array[n] = fib_array[n - 1] + fib_array[n - 2]
    end
    n += 1
  end
  p fib_array
end

def fibs_rec(num, array = [])
  if num == 0
    return
  elsif num == 1
    array << 0
  elsif num == 2
    if array.empty?
      array << 0
    end
    array << 1
  else
    result = fibs_rec(num - 1)
    result << result[-1] + result[-2]
    array = result
  end

  array
end

def merge_sort(array,sorted_array = [])
  if array.length == 1
    array
  else
    array = array.each_slice((array.size / 2.0).round).to_a
    a = merge_sort(array[0])
    b = merge_sort(array[1])
    if a.is_a?(Integer)
      if a > b
        sorted_array[0] = b
        sorted_array[1] = a
      else
        sorted_array[0] = a
        sorted_array[1] = b
      end
    else
      until a.empty? && b.empty?
        if a.empty?
          sorted_array << b.first
          b.delete_at(0)
        elsif b.empty?
          sorted_array << a.first
          a.delete_at(0)
        elsif a.first > b.first
          sorted_array << b.first
          b.delete_at(0)
        else
          sorted_array << a.first
          a.delete_at(0)
        end
      end
    end

    sorted_array
  end
end

# puts factorial(4)
# bottles(99)
# puts fibonacci(6)
# flatten([[1, [8, 9]], [3, 4]])
# fibs(8)
# p fibs_rec(8)
p merge_sort([1, 27, 5, 2, 13, 6, 7, 10, 4, 99, 9])
