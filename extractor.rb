file_name = ARGV.first
if !file_name
  puts "Usage: ruby extractor.rb <filename>"
end

plist_data = `openssl smime -inform der -verify -noverify -in #{file_name} 2> /dev/null`
puts /<key>UUID<\/key>\n  <string>(.+)<\/string>/.match(plist_data).captures[0]
