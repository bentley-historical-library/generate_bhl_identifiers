class GenerateResourceIdentifiersController < ApplicationController

  skip_before_filter :unauthorised_access

  def generate
    response = JSONModel::HTTP::post_form("/repositories/#{session[:repo_id]}/plugins/generate_resource_identifiers/next")

    if response.code == '200'
      render :json => ASUtils.json_parse(response.body)
    else
      render :status => 500
    end
  end

end
