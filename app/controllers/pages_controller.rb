class PagesController < ApplicationController
  def home
  end

  def members
  end

  def events
  end

  def photos
    @galleries = Dir[Rails.root.join "app", "assets", "images", "photos", "*"].
                 select { |child| File.directory? child }.sort
  end

  def downloads
  end

  def constitution
  end

  def contact
  end
end
