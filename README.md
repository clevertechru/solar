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
    git clone https://github.com/clevertechru/solar.git && cd solar
    bundle install
    mv config/secrets.example.yml config/secrets.yml
    mv config/database.example.yml config/database.yml
    vim config/database.yml
    rake db:migrate
    rails s
    http://localhost:3000
```

``` 
    mkdir solar && cd solar
    docker pull clevertechru/docker-solar
    mkdir config && wget https://raw.githubusercontent.com/clevertechru/solar/master/config/database.example.yml -O ./config/database.yml
    vim config/database.yml
    docker run -p 3003:3000 -d -v /[fullpath]/config/database.yml:/app/config/database.yml --name solar-app clevertechru/docker-solar
    docker exec -it solar-app bundle exec rake db:migrate
```
```
    echo 'docker compose is not working now ;('
    mkdir solar && cd solar
    wget https://raw.githubusercontent.com/clevertechru/solar/master/docker-compose.yml -O docker-compose.yml
    docker-compose up  
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
