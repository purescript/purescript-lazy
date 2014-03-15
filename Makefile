all: lib

lib:
	mkdir -p js/Data
	psc src/Data/Lazy.purs.hs \
	  -o js/Data/Lazy.js \
	  -e js/Data/Lazy.e.purs.hs \
	  --magic-do --module Data.Lazy

