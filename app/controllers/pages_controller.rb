class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :profile ]

  def home
    @activities = Activity.all
    @venues = Venue.all
  end

  def profile
    @venues = Venue.where(user: current_user)
  end
end
