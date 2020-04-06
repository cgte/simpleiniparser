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
	make ship3
	git push
	make ship2

.ONESHELL:
.PHONY:
rpm:
	. venv/bin/activate
	python setup.py bdist_rpm

.ONESHELL:
.PHONY:
ship3:
	. venv/bin/activate
	python setup.py sdist bdist_wheel
	twine upload --verbose -r testpypi dist/*`git describe --abbrev=0 --tag`*

.ONESHELL:
.PHONY:
release:
	. venv/bin/activate
	git push
	python setup.py sdist bdist_wheel
	twine upload --verbose -r testpypi dist/*`git describe --abbrev=0 --tag`*


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

