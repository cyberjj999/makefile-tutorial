# checks if the OS is windows, if it is, the equivalent commands are listed below
ifeq ($(OS), Windows_NT)
# run in cmd 'make run' (prerequisite would be the existence of my-package/main.py)
run: my-package/main.py
	python my-package/main.py

# run in cmd 'make install'
install: requirements.txt
	pip install -r requirements.txt

# run in cmd 'make build'
build: setup.py
	python setup.py build bdist_wheel

# run in cmd 'make clean'
clean:
# rd /s /q <folder> is a command in windows to remove a specific directory
# the 'if exist' portion of the code just make sure the folder/file exist before you run the delete command; you need that otherwise your program may crash.
	if exist "./build" rd /s /q build
	if exist "./dist" rd /s /q dist
	if exist "./myprojectname.egg-info" rd /s /q myprojectname.egg-info

# else means that the OS is either mac/linux (or something else)
else
run: my-package/main.py
# we then use python3 instead of python (because some linux system specify python3 vs windows which uses python)
	python3 my-package/main.py

install: requirements.txt
	pip3 install -r requirements.txt

build: setup.py
	python3 setup.py build bdist_wheel

clean:
# we also replace our previous windows command with rm -rf instead.
	rm -rf build
	rm -rf dist
	rm -rf myprojectname.egg-info
endif