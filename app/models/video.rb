class Video < ActiveRecord::Base
  mount_uploader :file, VideoUploader

  def set_success(format, opts)
    self.success = true
  end

  def video_screenshot

    screenshot_path = Rails.root+"/app/assets/images/screenshots/#{self.slug}_#{self.id}.jpg"

    if FileTest.exists?(screenshot_path)
      @screenshot = screenshot_path
    else
      video_file = FFMPEG::Movie.new("#{Rails.root}/public"+self.video.url(:mp4))
      @screenshot = video_file.screenshot("#{screenshot_path}")
    end

  end

  def set_video_info
    movie = FFMPEG::Movie.new("#{Rails.root}/public"+self.file.url(:mp4))
#     movie.duration # 7.5 (duration of the movie in seconds)
#     movie.bitrate # 481 (bitrate in kb/s)
#     movie.size # 455546 (filesize in bytes)
#
#     movie.video_stream # "h264, yuv420p, 640x480 [PAR 1:1 DAR 4:3], 371 kb/s, 16.75 fps, 15 tbr, 600 tbn, 1200 tbc" (raw video stream info)
#     movie.video_codec # "h264"
#     movie.colorspace # "yuv420p"
#     movie.resolution # "640x480"
#     movie.width # 640 (width of the movie in pixels)
#     movie.height # 480 (height of the movie in pixels)
#     movie.frame_rate # 16.72 (frames per second)
#
#     movie.audio_stream # "aac, 44100 Hz, stereo, s16, 75 kb/s" (raw audio stream info)
#     movie.audio_codec # "aac"
#     movie.audio_sample_rate # 44100
#     movie.audio_channels # 2
#
# # Multiple audio streams
#     movie.audio_streams[0] # "aac, 44100 Hz, stereo, s16, 75 kb/s" (raw audio stream info)
#
#     movie.valid? # true (would be false if ffmpeg fails to read the movie)
  end

end
