# Installation

- Clone Repo

- Either run `install-run.sh`

  - `$ chmod +x ./install-run.sh` OR
  - `$ bash install-run.sh`

- OR if you have bundler bundle install then run index.rb
  - `$ bundle install`
  - `$ ruby index.rb`

### Supported Flags

- -help: runs help file eg

  - `$ ruby index.rb -help`

- -name: Supplies first argument as name eg

  - `$ ruby index.rb -name Alex`

- -sign: Fetches horoscope for supplied sign only and does not run rest of Daily Horoscope eg
  - `$ ruby index.rb -sign Pisces`
