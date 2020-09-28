# Configuration variables:
.DEFAULT_GOAL := project

export APP_NAME = TheApp
export BUNDLE_IDENTIFIER = com.new.appIdentifier
# Prepare Application workspace
project:
	xcodegen generate 
	bundle exec pod install

resources:
	mkdir -p "Sources/App/Supporting Files/Generated"
	swiftgen config run --config swiftgen.yml

dependencies: 
	bundle exec pod install --repo-update

update_dependencies:
	bundle exec pod update

# Reset the project for a clean build
clean:
	rm -rf *.xcodeproj
	rm -rf *.xcworkspace
	rm -rf Pods/
	
format:
	swiftformat .
	swiftlint autocorrect

# Install dependencies, download build resources and add pre-commit hook


setup:
	make clean
	bundle config set path 'vendor/bundle'
	bundle update
#	brew update && brew bundle
	brew bundle
	make git_setup
	make resources
#	bundle exec pod repo update
	make project

git_setup:
	eval "$$add_pre_commit_script"

# Define pre commit script to auto lint and format the code
define _add_pre_commit
if [ -d ".git" ]; then
cat > .git/hooks/pre-commit << ENDOFFILE
#!/bin/sh
FILES=\$(git diff --cached --name-only --diff-filter=ACMR "*.swift" | sed 's| |\\ |g')
[ -z "\$FILES" ] && exit 0
# Format
swiftformat \$FILES
# Lint
swiftlint autocorrect \$FILES
swiftlint lint \$FILES
# Add back the formatted/linted files to staging
echo "\$FILES" | xargs git add

exit 0
ENDOFFILE

chmod +x .git/hooks/pre-commit
fi
endef
export add_pre_commit_script = $(value _add_pre_commit)

