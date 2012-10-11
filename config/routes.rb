PburgStuCo::Application.routes.draw do
  root to: "Pages#home"
  %w[home index].each { |r| match "/#{r}" => redirect("/") }

  %w[members events photos downloads constitution contact].each do |r|
    match "/#{r}" => "Pages##{r}"
  end
end
