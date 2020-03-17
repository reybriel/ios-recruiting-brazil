# Travis CI
if [ ! -z "$ON_CI" ]; then
    gem install bundler:2.0.2
fi

# Dependencies
carthage bootstrap --platform iOS --cache-builds
bundle install
