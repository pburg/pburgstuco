module PagesHelper
  # Takes the photo gallery at +dir+, with the name +name+, and creates a
  # Lightbox 2 group from them. Within +dir+ there may be a directory named
  # <tt>thumbs</tt> containing the respective thumbnails for each image.
  def lightbox_group(name, dir)
    images = Dir[File.join(dir, "*.{jpg,JPG,png,PNG,gif,GIF}")].
             sort { |a, b| image_name(a).to_i <=> image_name(b).to_i }

    singles = images.each_with_index.map do |f, i|
      filename = File.join("/", "assets", f.split(File::SEPARATOR)[-3..-1])
      thumbname = File.exists?(thumbs_dir f) \
                  ? File.join(thumbs_dir filename)
                  : filename

      title = "#{i + 1} of #{images.size}"
      cls = "single#{i.zero? ? " first" : i == images.size - 1 ? " last" : ""}"

      content_tag(:div, :class => cls) do
        content_tag(:a,
                    rel: "lightbox[#{name.downcase.gsub(" ", "-")}]",
                    href: filename) do
          image_tag thumbname, alt: title, size: "100x100"
        end
      end
    end

    content_tag(:div, :class => "image-row") do
      content_tag(:div, :class => "set") do
        singles.collect { |s| concat s }
      end
    end
  end

private

  # Returns the basename of an image without its file extension.
  #
  #   image_name "/path/to/name_of_image.jpg"  # => "name_of_image"
  def image_name(image)
    File.basename image, "*.{jpg,JPG,png,PNG,gif,GIF}"
  end

  # Takes the image at +path+ and returns the path to the thumbnail for that
  # image, assuming that the thumbnail has the same filename and resides in
  # a child directory named <tt>thumbs</tt>.
  #
  #   thumbs_dir "/path/to/image.jpg"  # => "/path/to/thumbs/image.jpg"
  def thumbs_dir(path)
    File.join File.dirname(path), "thumbs", File.basename(path)
  end
end
