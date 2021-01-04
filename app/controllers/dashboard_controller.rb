class DashboardController < ApplicationController
  def show
    if current_user
      @current_user = current_user

      @public_repos, @private_repos = RepositoryFacade.all_repos(current_user)
    else
      render file: "#{Rails.root}/public/404", status: 404
      nil
    end
  end
end
