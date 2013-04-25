class Gravatar

  def initialize(email)
    @email = email
  end

  def user
    Digest::MD5.hexdigest(@email.to_s.strip.downcase)
  end

  def url
    "https://secure.gravatar.com/avatar/#{user}"
  end

end
