#!/bin/bash
set -e

exit_err() {
    echo "ERROR: $@" >&2
    exit 1
}

echo "Enter project name:"
read project_name </dev/tty

if [ -z "$project_name" ]; then
    exit_err "please provide a project name."
fi

git clone git@github.com:mariusgiger/data-science-template.git "$project_name"
cd $project_name
pip3 install -U virtualenv
virtualenv -p python3 .
source ./bin/activate

python3 -m pip install -U pip
pip install -r requirements.txt
pip install -U jupyter_contrib_nbextensions

jupyter contrib nbextension install --sys-prefix
jupyter nbextension enable code_prettify/autopep8
ipython kernel install --user --name $project_name --display-name "Python ($project_name)"

rm -rf .git
git init
git add .
git commit -m "initial commit"