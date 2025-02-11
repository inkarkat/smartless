# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 2.0.2 - 11-Feb-2025
### Fixed
- less eats the head's last char right at the end of the line
- Avoid "smartless: line 148: $1: substring expression < 0" in small terminal

## 2.0.1 - 05-Oct-2024
### Fixed
- Truncation algorithm did not consider the tab width, resulting in occasional printing of a truncation message even though the whole contents were printed without a pager.

## 2.0.0 - 04-Oct-2024
### Changed
- Truncation now happens in the middle, not at the end of the output.

## 1.5.0 - 14-Jan-2020
### Added
- Implementated capture and recall

## 1.0.0 - 28-Mar-2017
- Forked and made first changes
