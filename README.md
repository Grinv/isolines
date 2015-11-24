# isoLines

[![Build Status](https://travis-ci.org/ipelekhan/isolines.svg)](https://travis-ci.org/ipelekhan/isolines)
[![Code Climate](https://codeclimate.com/github/ipelekhan/isolines/badges/gpa.svg)](https://codeclimate.com/github/ipelekhan/isolines)
[![Issue Count](https://codeclimate.com/github/ipelekhan/isolines/badges/issue_count.svg)](https://codeclimate.com/github/ipelekhan/isolines)

This project is a little bit complicated clone of the old classic Color Lines game.

## Installation

This project uses grunt as a build tool, so you'll need to have installed node.js (tested with v4.2.2).

```bash
$ git clone https://github.com/ipelekhan/isolines.git
$ cd ./isolines
$ npm install
$ bower install
$ npm install -g grunt-cli
```

## Usage

There are several grunt tasks pre-defined:

* ```grunt``` is a default task, that builds development version of the project and then runs development server with the Browsersync and source watch
* ```grunt build``` task builds a production version of the project
* ```grunt serve``` task builds a production version of the project and starts simple web server to test it
* ```grunt deploy``` task deploys project to the gh-pages branch on the Github (```grunt build``` should be run first)

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Do nothing, I am not going to receive PRs for my home project :laughing:

## History

* 2015/11/24 Development environment is set (I guess)
* 2015/11/18 Initial commit

## Credits

Well, just me, [Igor Pelekhan](//twitter.com/ipelekhan) :wink:

## License

See LICENSE file in the current repository.
