require 'aruba/api'

def needs(path)
  current_directory = File.dirname(__FILE__)
  full_path = File.expand_path(current_directory + '/../' + path)
  unless $:.include?(full_path)
    $: << full_path
  end
end

RSpec.configure do |c|
  c.include Aruba::Api
end
