def f(a, b, c, x)
    if((a.to_i && b.to_i) || (a.to_i && c.to_i)) == 0
        x = x.to_i
    end

    if c < 0 && b != 0
        return a*x*x + b*b*x
    elsif c > 0 && b == 0
        return (x+a)/(x+c)
    else
        return x/c
    end
end

puts "Input a, b, c, x_min, x_max, step"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
x_min = gets.chomp.to_f
x_max = gets.chomp.to_f
step = gets.chomp.to_f

output = []
(x_min..x_max).step(step) do |x|
    output << [x, f(a, b, c, x)]
end

puts "Output:"
puts "x   f(x)"
output.each do |x, f|
    puts x.truncate(5).to_s + " " + f.truncate(5).to_s
end