all: clean
	bundle exec rakep build

dependencies:
	bundle

clean:
	- rm -r public/
	- rm -r tmp/

# watch requires inotify-tools
watch:
	while true; \
	do \
		sleep 0.5; \
		inotifywait app/ || exit && make all; \
	done
