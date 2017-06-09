#!/bin/bash

# Install virtualenv and Python version
# -n -> keeps cursor on same line
echo "####################################################"
echo -n "Enter name for virtualenv > "
read env_name
echo -n "Which version of python [2] or [3] > "
read python_version

echo "####################################################"
# -eq means chechking condition "if 3==2"
if [ $python_version -eq 3 ] ; then
	virtualenv -p /usr/bin/python3.5 $env_name
else
	virtualenv $env_name
fi

echo "####################################################"
# Activate virtualenv
cd $env_name; source bin/activate

# Upgrade pip
pip install --upgrade pip

# install latest django version
pip install django

echo "####################################################"
# enter a project name
echo -n "Enter a django project name > "
read django_project
django-admin startproject $django_project
cd $django_project

echo "####################################################"
# start a django app
echo -n "Enter an app name > "
read django_app
python manage.py startapp $django_app
