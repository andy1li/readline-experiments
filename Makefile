all:
	@echo "\033[31mRunning javascript:\033[0m"
	make javascript
	@echo

	@echo "\033[31mRecording javascript:\033[0m"
	make record_javascript
	@echo

	@echo "\033[31mRunning ruby:\033[0m"
	make ruby
	@echo

	@echo "\033[31mRecording ruby:\033[0m"
	make record_ruby
	@echo

javascript:
	script -q /dev/null node experiments/javascript.js

record_javascript:
	script -q /dev/null node experiments/javascript.js > recordings/javascript.txt
	xxd recordings/javascript.txt

ruby:
	script -q /dev/null ruby experiments/ruby.rb

record_ruby:
	script -q /dev/null ruby experiments/ruby.rb > recordings/ruby.txt
	xxd recordings/ruby.txt
