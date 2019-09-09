1.	follow these instructions and conventions to set up the pip installable package:
	https://stackoverflow.com/questions/15746675/how-to-write-a-python-module-package
	(scroll down a bit)

2.	make new pip-installable package using
	python setup.py sdist

3.	install package with
	pip install ./dist/deepbuilder__--blablubb

4.	use with
	from deepbuilder_py import Msgs as m
	from deepbuilder_py import Networks as n


