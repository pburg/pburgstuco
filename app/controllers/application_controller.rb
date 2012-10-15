class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_version

  def set_version
    @version = File.read(Rails.root.join "VERSION").strip
    @changelog_link = "https://github.com/pburg/pburgstuco/blob/master/" +
                      "PRERELEASE-CHANGELOG.md##{@version.gsub ".", ""}"
  end
end
