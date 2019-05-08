require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe MynaBird do

  it_should_convert 'brendan@wistia.com',              to: 'wistia'
  it_should_convert 'brendan.schwartz@gmail.com',      to: 'brendan-schwartz'
  it_should_convert 'support@gmail.com',               to: 'support-at-gmail'

  it_should_convert 'brendan....schwartz@gmail.com',   to: 'brendan-schwartz'
  it_should_convert 'bts@alumni.brown.edu',            to: 'bts'
  it_should_convert 'claire@megacorp.co.uk',           to: 'megacorp'
  it_should_convert 'brendan19@aol.com',               to: 'brendan19'
  it_should_convert 'brendan.@aol.com',                to: 'brendan'
  it_should_convert '.brendan@aol.com',                to: 'brendan'
  it_should_convert 'brendan+nospam@aol.com',          to: 'brendan'
  it_should_convert 'BRENDAN@aol.com',                 to: 'brendan'
  it_should_convert 'brendan@WISTIA.COM',              to: 'wistia'
  it_should_convert 'BRENDAN@WISTIA',                  to: 'wistia'
  it_should_convert 'brendan@outlook.com',             to: 'brendan'
  it_should_convert 'james@outlook.com.br',            to: 'james'

  # bad input
  it_should_not_convert 'no.at.sign'
  it_should_not_convert '@domain.only'
  it_should_not_convert 'local.only@'
  it_should_not_convert '@@@@'
  it_should_not_convert '++@++'

  context 'domain should be avoided' do
    it 'uses the local name' do
      MynaBird.avoided_domains = ['post-jazz']
      MynaBird.convert('davej@post-jazz.no').should == 'davej'
    end
  end
end
