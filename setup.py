from setuptools import setup, find_packages

# run python setup.py build bdist_wheel to have a wheel file with the final build
# requires you to pip install wheel first
setup(
    name="myprojectname",
    version="1.0",
    # will find packages in the directory, i.e. those folders with __init__.py in them
    packages=find_packages()
)