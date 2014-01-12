#!/usr/bin/env ruby

if ARGV.length < 2
  puts "USAGE ./grep.rb pattern filename"
  exit
end

pattern = Regexp.new(ARGV[0])

File.open(ARGV[1]).each_line.with_index do |line,index|
  if line.match(pattern)
    # Highlight the matches; see: http://www.darkcoding.net/software/pretty-command-line-console-output-on-unix-in-python-and-go-lang/
    line.gsub!(pattern, "\033[1m\\0\033[0m")
    # Output highlighted line with line-number
    puts "#{index+1}: #{line}"
  end
end
