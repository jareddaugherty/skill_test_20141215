def recursively_print_tags(array, idx = 0)
  if !array.empty?
  	puts "#{"  " * idx}<#{array[0]}>"
    recursively_print_tags(array[1..-1], idx + 1)
    puts "#{"  " * idx}</#{array[0]}>"
  end
end

recursively_print_tags((1..6).to_a)
