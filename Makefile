all:
	make javascript_input_echoing
	make ruby_input_echoing
javascript_input_echoing:
	@echo "\033[31mRunning command:\033[0m"
	echo "The text you're seeing is echoed from readline" | node experiments/javascript_realine_input_echoing.js
	@echo

ruby_input_echoing:
	@echo "\033[31mRunning command:\033[0m"
	echo "The text you're seeing is echoed from readline" | ruby experiments/ruby_realine_input_echoing.rb
	@echo
