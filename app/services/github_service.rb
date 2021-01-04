require 'JSON'

# Service to interact with the GitHub API
class GithubService
  def self.repo_list(auth = nil)
    conn = create_connection('https://api.github.com/user/repos', auth)

    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_connection(uri, auth = nil)
    Faraday.new(uri) do |req|
      req.headers['Authorization'] = "token #{auth}" if auth
      req.params['visibility'] = 'all'
      req.params['per_page'] = 100
    end
  end
end
