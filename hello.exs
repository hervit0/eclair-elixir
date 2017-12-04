IO.puts "Hello from Hervito"

printer = fn a -> IO.puts a end
add = fn a, b -> a + b end

x = add.(1, 2)
printer.(x)
