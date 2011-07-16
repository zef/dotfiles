# load libraries
require 'rubygems'
# require 'wirble'
# require 'looksee/shortcuts'
# require 'hirb'

# start wirble (with color)
# Wirble.init
# Wirble.colorize

# Hirb::View.enable

def benchmark
  cur = Time.now
  result = yield
  print "#{cur = Time.now - cur} seconds"
  puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
  $last_benchmark = cur
  result
end
