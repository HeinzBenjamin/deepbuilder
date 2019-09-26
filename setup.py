from distutils.core import setup
from setuptools import find_packages

setup(
    name='deepbuilder',
    version='0.0.1dev',
    packages=find_packages(),
    license='GPLv3 License',
    long_description=open('README.md').read(),
)
