from setuptools import setup
from os import path

here = path.abspath(path.dirname(__file__))

name = "simpleiniparser"
version = "0.0.2"
description = "Simple tooling to seamlessly parse ini file"
long_description = """
It may feel boring to rewrite a parser fore every project you start.

Filling your ini file with pythonic values will make you save time.
"""
url = ""
packages = [
    "simpleiniparser",
]
package_data = {}
install_requires = []
author = "Colin Goutte"
license = "Apache 2"
classifiers = [
    "Programming Language :: Python :: 2",
    "Programming Language :: Python :: 2.7",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.6",
    "Programming Language :: Python :: 3.7",
    "Programming Language :: Python :: 3.8",
    "Intended Audience :: Developers",
    "Natural Language :: English",
]
keywords = "ini utilities"
setup(
    name=name,
    version=version,
    description=description,
    long_description=long_description,
    url=url,
    packages=packages,
    package_data=package_data,
    install_requires=install_requires,
    author=author,
    license=license,
    classifiers=classifiers,
    keywords=keywords,
)
