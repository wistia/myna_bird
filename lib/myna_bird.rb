class MynaBird
  
  class MalformedEmailException < Exception
  end
  
  COMMON_LOCALS = %w(
    support info sales marketing admin webmaster help
  )
  
  COMMON_DOMAINS = %w(
    hotmail msn live yahoo yahoo.co.uk ymail rocketmail gmail googlemail aol 
    fastmail.fm web mail.ru rediff indiatimes lycos libero.it rambler.ru mac 
    paracalls linkedin mynet interia.pl yandex.ru sina 126 lycos bol in me 
    voila.fr mail comcast netcom roadrunner verizon 1and1 att adelphia
    bigpond bluebottle blueyonder btopenworld charter cox earthlink sbc telus
    mailinator charter rogers sympatico tiscali tmail sbcglobal aim windowslive
    juno qq
  ) + [
    /\.edu$/
  ]
  
  def self.convert(email)
    new(email).name
  end
  
  def initialize(email)
    # email must be in a somewhat sane format
    # i.e. have an @ sign and at least one letter or number on each side of it
    raise MalformedEmailException unless email =~ /^[^@]*[a-z0-9][^@]*@[^@]*[a-z0-9][^@]*$/i
    
    @email = email.downcase
    @local, @domain = @email.split('@')
  end
  
  
  # extract the name
  def name
    if common_local? && common_domain?
      local_name + '-at-' + domain_name
    elsif common_local?
      domain_name
    elsif common_domain?
      local_name
    else
      domain_name
    end    
  end
  
  def domain_name
    just_the_host = @domain.split('.').first
    self.class.nameize(just_the_host)
  end
  
  def local_name
    local_sans_alias = @local.gsub(/\+.*$/, '')
    self.class.nameize(local_sans_alias)
  end
  
  def self.nameize(str)
    name = str.downcase
    name.gsub!(/[^a-z0-9]+/, '-')
    name.gsub!(/\-$/,'')
    name.gsub!(/^\-/,'')
    name
  end
  
  def common_domain?
    COMMON_DOMAINS.each do |domain|
      if domain.is_a?(Regexp)
        return true if domain.match(@domain)
      else
        return true if /^#{domain}\./.match(@domain)
      end
    end
   
    return false
  end

  def common_local?
    COMMON_LOCALS.each do |local|
      if local.is_a?(Regexp)
        return true if local.match(@local)
      else
        return true if local == @local
      end
    end
    
    return false
  end
  
end
