require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module ShouldConvert
  def it_should_convert(from, to_hash)
    to = to_hash[:to]    
    it "should convert '#{from}' to '#{to}'" do
      MynaBird.convert(from) == to
    end
  end
end

describe MynaBird do
  extend ShouldConvert

  it_should_convert 'brendan@wistia.com',              :to => 'wistia'
  it_should_convert 'brendan.schwartz@gmail.com',      :to => 'brendan-schwartz'
  it_should_convert 'support@gmail.com',               :to => 'support-at-gmail'
  
  it_should_convert 'brendan....schwartz@gmail.com',   :to => 'brendan-schwartz'
  it_should_convert 'bts@alumni.brown.edu',            :to => 'bts'
  it_should_convert 'claire@megacorp.co.uk',           :to => 'megacorp'
  it_should_convert 'brendan19@aol.com',               :to => 'brendan19'
  it_should_convert 'brendan.@aol.com',                :to => 'brendan'
  it_should_convert '.brendan@aol.com',                :to => 'brendan'
  it_should_convert 'brendan+nospam@aol.com',          :to => 'brendan'
  it_should_convert 'BRENDAN@aol.com',                 :to => 'brendan'
  it_should_convert 'brendan@WISTIA.COM',              :to => 'wistia'
  
end