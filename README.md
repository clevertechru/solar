Solar
================

Video management system
[mov avi mkv mpeg mpeg2 mp4 3gp] -> [mp4, webm]

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.5
- Rails 4.2.7.1
- FFmpeg 
```
    for macos: $ brew install ffmpeg --with-libefreetype or https://gist.github.com/clayton/6196167
                 brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265
    for ubuntu with codecs https://gist.github.com/xdamman/e4f713c8cd1a389a5917
```
- ffmpegthumbnailer
```
    for macos: $ brew install ffmpegthumbnailer
```
Getting Started
---------------

```
    git clone https://github.com/clevertechru/solar.git
    cd solar
    bundle install
    rails s
    http://localhost:3000

    or run docker image https://hub.docker.com/r/clevertechru/solar/
    docker pull clevertechru/solar
    docker run -p 3000:3000 -d --name docker-solar clevertechru/solar
```
Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
