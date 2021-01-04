class RepositoryFacade
  def self.all_repos(user)
    parsed_response = GithubService.repo_list(user.auth_token)

    typed_repos = parsed_response.group_by do |repo|
      repo[:private]
    end


    [
      instantiate_repos(typed_repos[false]),
      instantiate_repos(typed_repos[true])
    ]
  end

  def self.instantiate_repos(repos)
    repos.map do |repo_data|
      Repo.new(repo_data.symbolize_keys)
    end
  end
end
