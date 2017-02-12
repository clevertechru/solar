class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  # include CarrierWave::Backgrounder::Delay
  storage :file

  # process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]
  version :mp4 do
    process :encode_video => [:mp4, callbacks: { after_transcode: :set_success }]
    def full_filename(for_file)
      "#{File.basename(for_file, File.extname(for_file))}.mp4"
    end
  end

  version :webm do
    process :encode_video => [:webm]
    def full_filename(for_file)
      "#{File.basename(for_file, File.extname(for_file))}.webm"
    end
  end

  process :encode

  DEFAULTS = {}
  def encode
    encode_video(:mp4, DEFAULTS) do |movie, params|
      watermark = MagickTitle.say self.model.watermark
      options = {
          watermark: File.join(watermark.path, watermark.filename),
          resolution: movie.resolution,
          watermark_filter: {position: "RB", padding_x: 10, padding_y: 10},
          custom: %w(-strict experimental)
      }
      tmp_path = File.join File.dirname(current_path), 'tmp.mp4'
      FFMPEG::Movie.new(self.file.path).transcode tmp_path, options
      File.rename tmp_path, current_path
    end
  end

  def cache_dir
    Rails.root.join 'tmp/uploads'
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process thumbnail: [{format: 'png', quality: 10, size: 1200, strip: false, seek: 10, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
  end

  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end

  def extension_white_list
    %w(mov avi mkv mpeg mpeg2 mp4 3gp)
  end
end