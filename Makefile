.PHONY: install-deps
install-deps:
	sudo apt install ruby ruby-dev
	sudo gem install bundler:1.17.3

.PHONY: run-locally
run-locally:
	bundle install
	bundle exec middleman server