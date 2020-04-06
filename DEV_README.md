rpm/setuptools/pypi/markdown issue:
If you build rpm and then try to upload with twine it bugs due to some configparsing issue.
if you try:
  python setup.py bdist_<snip> upload -r testpypi
then it fails due to https://github.com/pypa/warehouse/issues/4079



