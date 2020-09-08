# Data science template

Repository holding template structure for data science.

## TL;DR

```
curl -s -L https://raw.githubusercontent.com/mariusgiger/data-science-template/master/setup.sh | bash
```

## Work

run the following command:

```{.sh}
./start.sh
```

This will enter the virtual environment and start `jupyter`. Stop it by pressing `Ctrl-c`.

You can enter the virtual env manually by running:

```{.sh}
source bin/activate
```

You can then install dependencies:

```{.sh}
pip install <name>
```

Freeze the current dependencies:

```{.sh}
pip freeze > requirements.txt
```

Upgrade all packages:

```
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
pip freeze > requirements.txt
```

Install `jupyter` extensions:

```
pip install -U jupyter_contrib_nbextensions
jupyter contrib nbextension install --sys-prefix
jupyter nbextension enable code_prettify/autopep8
```

Leave the virtual env using the following command:

```{.sh}
deactivate
```

## Troubleshooting

To fix a broken environment, run the following commands

```
rm -rf .Python bin/python* lib/python*/* include/python*
pip3 install -U virtualenv
virtualenv -p python3 .
source ./bin/activate
python3 -m pip install --upgrade pip
pip install -r requirements.txt
pip install -U jupyter_contrib_nbextensions

jupyter contrib nbextension install --sys-prefix
jupyter nbextension enable code_prettify/autopep8
ipython kernel install --user --name $project_name --display-name "Python ($project_name)"
```

## Useful Links

- https://medium.com/@eleroy/jupyter-notebook-in-a-virtual-environment-virtualenv-8f3c3448247
