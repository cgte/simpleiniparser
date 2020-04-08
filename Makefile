.ONESHELL:
.PHONY:
setup:
	. venv/bin/activate
	pip install -U pip twine setuptools
	pip install -e .[dev]

.ONESHELL:
.PHONY:
setup2:
	. venv2/bin/activate
	pip install -U pip twine setuptools
	pip install -e .[dev]

.ONESHELL:
.PHONY:
ship2:
	. venv2/bin/activate
	python setup.py sdist bdist_wheel
	twine upload --verbose -r testpypi dist/*`git describe --abbrev=0 --tag`*py2*

.ONESHELL:
.PHONY:
ship:
	bumpversion patch
	git push origin `git describe --abbrev=0 --tag`
	make ship3
	make ship2
	make public

.ONESHELL:
.PHONY:
ship3:
	. venv/bin/activate
	python setup.py sdist bdist_wheel
	twine upload --verbose -r testpypi dist/*`git describe --abbrev=0 --tag`*

.ONESHELL:
.PHONY:
release:
	bumpversion minor
	git push origin `git describe --abbrev=0 --tag`
	make ship2
	make ship3
	make public

.ONESHELL:
.PHONY:
public:
	twine upload --verbose -r realpypi dist/*`git describe --abbrev=0 --tag`*


.ONESHELL:
.PHONY:
cleanbuild:
	find . -name "*.egg-info" | xargs rm -r  || true


.ONESHELL:
.PHONY:
test2: cleanbuild
	find . -name "*.pyc" -delete
	. venv2/bin/activate
	pytest



.ONESHELL:
.PHONY:
rpm:
	. venv/bin/activate
	python setup.py bdist_rpm


.ONESHELL:
.PHONY:
check_install:
	deactivate
	python -m venv venv_check
	. venv_check/bin/activate
	make setup
	pip install --index-url  https://test.pypi.org/simple simpleiniparser

