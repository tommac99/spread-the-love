class PagesController < ApplicationController
  # all other actions will have application layout
  layout 'react'

  def home
    @user = current_user
  end

  def privacy_policy
  end

end
