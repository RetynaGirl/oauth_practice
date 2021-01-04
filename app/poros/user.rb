class User
  attr_reader :username, :auth_token, :repos_url
  def initialize(data)
    @username = data[:username]
    @auth_token = data[:auth_token]
    @repos_url = data[:repos_url]
  end
end
