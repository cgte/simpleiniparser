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
twine:
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

.ONESHELL:
.PHONY:
check_install:
	deactivate
	python -m venv ven_check
	. venv/bin/activate
	pip install --index-url  https://test.pypi.org/simple simpleiniparser

