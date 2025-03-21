setup:
	python -m pip install --upgrade pip
	pip install flake8 pytest
	if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

lint:
	flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
	flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics

test:
	pytest

get-image-version:
	echo "DOCKER_IMAGE_VERSION=$(git describe --tags --always)" >> $GITHUB_ENV
