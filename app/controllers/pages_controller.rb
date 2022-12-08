class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :profile ]

  def home
    @activities = Activity.all
    @venues = Venue.all
    @bowling = Activity.where(category: "bowling")
    @escape = Activity.where(category: "escape room")
  end

  def profile
    @venues = Venue.where(user: current_user)
  end
end
