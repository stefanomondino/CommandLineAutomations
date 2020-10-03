# Command-line Automations - Unchain your Xcode projects!

This repo is a working demo for my talk @SwiftHeroes2020

Slides are available [here](./slides.pdf)

## About this repo.

This project can be a good starting point for any "fresh project" that is about to start.
It's a good showcase of tools that improves code quality (SwiftFormat and SwiftLint), helps managing the "xcodeproj" merge conflict hell (XCodeGen) and creates static references to resources (with SwiftGen). 
The final goal is to have a project ready to be shared with other developers (without the hassle of explaining the steps to rebuild a working environment) and ready to be used in a CI/CD environment

> This is **not** an "architectural" repo, and swift code inside is not following any particular best practice related to architectural/pattern stuff. 


## Pre-requisites

- A working XCode installation (with command-line-tools installed)
- Working Ruby environment (system default or `rbenv`/`rvm`)
- `bundler` installed (`gem install bundler`, with `sudo` if needed)
- `homebrew` installed (`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`)

## Instructions

- `make setup` will install every dependency (either tools AND code dependencies like Pods) and create xcodeproj with XCodeGen
- `make clean` removes Pods folder and XCode project/workspace 
- `make` or `make project` will create xcodeproj (according to `project.yml` file) and reinstall pods
- `make resources` will create generated resources files with SwiftGen (according to `swiftgen.yml`). Configuration folder contains templates for colors, images and translations, and specific json file for colors.
- `make format` will automatically apply formatting rules through SwiftFormat (check `.swiftformat` file for rules) and SwiftLint (check `.swiftlint.yml` for rules).
- `make dependencies` is the same as `bundle exec pod install --repo-update`
- `make update_dependencies` runs `bundle exec pod update`. 
- `make git_setup` creates a pre-commit git hook that runs SwiftFormat and SwiftLint (with proper rules, see `make format`) on every file added or modified inside a commit.

> On some git installations, the git hooks folder may not be present. In that cases, simply run `git init` and try again

To change your project name, close your workspace, edit `Makefile` by changing `export APP_NAME = "<yourAppName"` and run `make setup` again
Same thing for bundle identifier and every environment variable you can think about :) 

Contributions are more than welcomed!
