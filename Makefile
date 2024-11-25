check_recordings:
	xxd recordings/c.txt
	@echo
	xxd recordings/javascript.txt
	@echo
	xxd recordings/ruby.txt

run_experiments:
	@echo "\033[31mRunning c:\033[0m"
	make c
	@echo

	@echo "\033[31mRecording c:\033[0m"
	make record_c
	@echo

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

c:
	gcc experiments/c.c -o experiments/c.out -lreadline
	./experiments/c.out

record_c:
	script -q /dev/null ./experiments/c.out > recordings/c.txt
	xxd recordings/c.txt

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
