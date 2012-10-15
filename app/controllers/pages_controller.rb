class PagesController < ApplicationController
  def home
  end

  def members
  end

  def events
  end

  def photos
    @albums = Dir[Rails.root.join "app", "assets", "images", "photos", "*"].
              select { |entry| File.directory? entry }.sort
  end

  def downloads
  end

  def constitution
  end

  def contact
  end
end
