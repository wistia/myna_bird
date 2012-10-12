$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'myna_bird'
require 'rspec'

module ShouldAndShouldNotConvert
  def it_should_convert(from, to_hash)
    to = to_hash[:to]    
    it "should convert '#{from}' to '#{to}'" do
      MynaBird.convert(from) == to
    end
  end
  
  def it_should_not_convert(from)
    it "should raise MalformedEmailException when attempting to convert '#{from}'" do
      lambda {
        MynaBird.convert(from)
      }.should raise_error(MynaBird::MalformedEmailException)
    end
  end
end

RSpec.configure do |config|
  config.extend(ShouldAndShouldNotConvert)
end
