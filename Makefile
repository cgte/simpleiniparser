.ONESHELL:
.PHONY:
localupdate:
	. venv/bin/activate
	python setup.py sdist bdist_wheel  upload -v -r internal

.ONESHELL:
.PHONY:
setup:
	pip install -U pip twine setuptools

.ONESHELL:
.PHONY:
sdist:
	. venv/bin/activate
	python setup.py sdist

.ONESHELL:
.PHONY:
wheel:
	. venv/bin/activate
	python setup.py bdist_wheel

.ONESHELL:
.PHONY:
rpm:
	. venv/bin/activate
	python setup.py bdist_rpm


.ONESHELL:
.PHONY:
build_all: sdist wheel rpm

.ONESHELL:
.PHONY:
twine:
	twine upload --verbose --repository-url https://test.pypi.org/legacy/ dist/*

.ONESHELL:
.PHONY:
build_push: cleanbuild build_all twine

.ONESHELL:
.PHONY:
cleanbuild:
	rm  dist/*


.ONESHELL:
.PHONY:
check_install:
	deactivate
	python -m venv venv_check
	. venv_check/bin/activate
	make setup
	pip install --index-url  https://test.pypi.org/simple simpleiniparser

truc:

	twine upload --verbose -r internal dist/*`git describe --abbrev=0 --tag`*


.ONESHELL:
.PHONY:
ship:
	. venv/bin/activate
	#python setup.py sdist bdist_rpm bdist_wheel
	python setup.py sdist bdist_wheel bdist_rpm upload -v -r internal
	#python setup.py upload -r internal  -- dist/*`git describe --abbrev=0 --tag`*
