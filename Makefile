langName := dart
pjName := mooxe/${langName}

build:
	docker build -t ${pjName} .

rebuild:
	docker build --no-cache=true -t ${pjName} .

in:
	docker run --rm \
		--name=mooxe_${langName} \
		-ti \
		-v $$(pwd):/root/${langName} \
		${pjName} \
			/bin/bash

push:
	docker push ${pjName}
