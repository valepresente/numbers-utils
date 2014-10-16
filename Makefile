deploy: clear_dist compile_source create_minified_version

compile_source:
	coffee --compile --no-header --output dist source/numbers-utils.coffee
	coffee --map --no-header --output dist source/numbers-utils.coffee

create_minified_version:
	cd dist; uglifyjs --source-map numbers-utils.min.js.map --output numbers-utils.min.js numbers-utils.js

clear_dist:
	rm -rf ./dist

test:
	./node_modules/jasmine-node/bin/jasmine-node --coffee spec
