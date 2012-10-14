module PagesHelper
  def lightbox_group(name, dir)
    images = Dir[File.join(dir, "*.{jpg,JPG,png,PNG,gif,GIF}")]

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

  def thumbs_dir(path)
    File.join(File.dirname(path), "thumbs", File.basename(path))
  end
end
