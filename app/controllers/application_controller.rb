class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_globals

  def init_globals
    # Navigation links
    @nav_links = {
      "Home" => root_path,
      "Members" => members_path,
      "Events" => events_path,
      "Photos" => photos_path,
      "Downloads" => downloads_path,
      "Constitution" => constitution_path
    }

    # Set version info
    @version = File.read(Rails.root.join "VERSION").strip
    @changelog_link = "https://github.com/pburg/pburgstuco/blob/master/" +
                      "PRERELEASE-CHANGELOG.md##{@version.gsub ".", ""}"

    # External links
    @development_server = "pburgstuco-dev.herokuapp.com"
    @production_server = "pburgstuco.herokuapp.com"
  end
end
