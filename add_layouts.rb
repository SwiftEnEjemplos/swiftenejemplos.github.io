def process_file(file)
  original_file = file
  new_file = original_file + ".new"

  File.open(new_file, 'w') do |fo|
    fo.puts '---'
    fo.puts 'layout: doc'
    fo.puts '---'
    fo.puts "\n"

    File.foreach(original_file) do |li|
      fo.puts li
    end
  end

  File.rename(original_file, original_file + ".old")
  File.rename(new_file, original_file)
  File.delete(original_file+".old")
end

Dir["#{Dir.pwd}/**/*.md"].each do |file|
  process_file(file)
end
