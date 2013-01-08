all: clean
	bundle exec rakep build

dependencies:
	bundle

clean:
	- rm -r public/
	- rm -r tmp/
