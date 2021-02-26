# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:

## [v5.0.0](https://github.com/purescript/purescript-lazy/releases/tag/v5.0.0) - 2021-02-26

Breaking changes:
- Added support for PureScript 0.14 and dropped support for all previous versions (#29)

New features:
- Added roles declarations to allow safe coercions (#28)

Bugfixes:

Other improvements:
- Removed `fold1` member from `Foldable1` and added `foldr1` and `foldl1` (#30, #32)
- Migrated CI to GitHub Actions and updated installation instructions to use Spago (#31)
- Added a changelog and pull request template (#33)

## [v4.0.0](https://github.com/purescript/purescript-lazy/releases/tag/v4.0.0) - 2018-05-23

- Updated for PureScript 0.12
- Added various `Foldable`-related instances (@matthewleon)

## [v3.0.0](https://github.com/purescript/purescript-lazy/releases/tag/v3.0.0) - 2017-03-26

- Updated for PureScript 0.11

## [v2.0.0](https://github.com/purescript/purescript-lazy/releases/tag/v2.0.0) - 2016-10-02

- Updated dependencies

## [v1.0.1](https://github.com/purescript/purescript-lazy/releases/tag/v1.0.1) - 2016-09-18

- Removed use of `delete` in JS implementation (#16 by @rightfold)

## [v1.0.0](https://github.com/purescript/purescript-lazy/releases/tag/v1.0.0) - 2016-06-01

This release is intended for the PureScript 0.9.1 compiler and newer.

**Note**: The v1.0.0 tag is not meant to indicate the library is “finished”, the core libraries are all being bumped to this for the 0.9 compiler release so as to use semver more correctly.

## [v0.4.1](https://github.com/purescript/purescript-lazy/releases/tag/v0.4.1) - 2016-04-20

- Functionally equivalent to v0.4.0, update allows publishing on Pursuit.

## [v1.0.0-rc.1](https://github.com/purescript/purescript-lazy/releases/tag/v1.0.0-rc.1) - 2016-03-25

- Release candidate for the psc 0.8+ core libraries

## [v0.4.0](https://github.com/purescript/purescript-lazy/releases/tag/v0.4.0) - 2015-06-30

This release works with versions 0.7.\* of the PureScript compiler. It will not work with older versions. If you are using an older version, you should require an older, compatible version of this library.

## [v0.3.1](https://github.com/purescript/purescript-lazy/releases/tag/v0.3.1) - 2015-03-19

- Updated docs, improved running time of `fromArray`.

## [v0.3.0](https://github.com/purescript/purescript-lazy/releases/tag/v0.3.0) - 2015-02-21

**This release requires PureScript v0.6.8 or later**

- Updated dependencies

## [v0.2.0](https://github.com/purescript/purescript-lazy/releases/tag/v0.2.0) - 2015-01-10

- Updated `purescript-foldable-traversable` dependency (@garyb)

## [v0.1.2](https://github.com/purescript/purescript-lazy/releases/tag/v0.1.2) - 2014-12-11

- Bumped `array` dependency

## [v0.1.1](https://github.com/purescript/purescript-lazy/releases/tag/v0.1.1) - 2014-10-19

- Added `Extend` and `Comonad` instances (@natefaubion)
- Removed quickcheck dependency and update dependency versions (@jdegoes)

## [v0.1.0](https://github.com/purescript/purescript-lazy/releases/tag/v0.1.0) - 2014-08-15

- Initial versioned release
