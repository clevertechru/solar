module VideosHelper
  def thumb(video_slug,video_id)
    "screenshots/#{video_slug}_#{video_id}.jpg"
  end
end
