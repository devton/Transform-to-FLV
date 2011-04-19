$:.unshift(File.dirname(File.expand_path('../',__FILE__)))
require 'rspec'
require 'lib/transform_to_flv'

Rspec.configure do |c|
  c.mock_with :rspec  
  
  c.after(:each) do
    Dir.glob(File.join('spec', 'video_converted', '*')).each do |file|
      File.delete(file) 
    end
  end  
end

