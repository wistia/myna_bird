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
  it_should_convert 'james@karaol.com',                to: 'karaol'

  # bad input
  it_should_not_convert 'no.at.sign'
  it_should_not_convert '@domain.only'
  it_should_not_convert 'local.only@'
  it_should_not_convert '@@@@'
  it_should_not_convert '++@++'

  describe '.avoided_domains' do
    before do
      MynaBird.avoided_domains = ['post-jazz', 'my']
    end

    it_should_convert 'davej@post-jazz.no',            to: 'davej'
    it_should_convert 'thijs@mychickennuggets.com',    to: 'mychickennuggets'
  end
end
