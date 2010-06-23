require 'sha1'

class RandGen

  def self.generate len=11
    srand
    seed = "--#{rand(999999999)}--#{Time.now}--"
    Digest::SHA1.hexdigest(seed)[0,len]
  end

end
