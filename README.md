# Data science template

Repository holding template struct for data science.

## Usage

```
curl -s -L https://raw.githubusercontent.com/mariusgiger/data-science-template/master/setup.sh | bash
```

## Dev Setup

Setup uses [Virtualenv](https://virtualenv.pypa.io/en/stable/).

```{.sh}
pip3 install -U virtualenv
virtualenv -p python3 .
source ./bin/activate
python3 -m pip install -U pip
python3 -m pip install -U jupyter
```

or run

```{.sh}
make install
```

## Work

```{.sh}
source ./bin/activate
jupyter notebook
```

or run

```{.sh}
make analyze
```

leave virtual env using the following command

```{.sh}
deactivate
```

install dependency

```{.sh}
pip install <name>
```

freeze dependencies

```{.sh}
pip freeze > requirements.txt
```

fix a broken env

```
rm -rf .Python bin/python* lib/python*/* include/python*
pip3 install -U virtualenv
virtualenv -p python3 .
source ./bin/activate
python3 -m pip install --upgrade pip
```

upgrade packages

```
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
pip freeze > requirements.txt
```

install extensions

```
pip install -U jupyter_contrib_nbextensions
jupyter contrib nbextension install --sys-prefix
jupyter nbextension enable code_prettify/autopep8
```

```
ipython kernel install --user
```

- https://medium.com/@eleroy/jupyter-notebook-in-a-virtual-environment-virtualenv-8f3c3448247
