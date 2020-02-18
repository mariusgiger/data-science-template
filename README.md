# Data science template

Repository holding template struct for data science.

## Dev Setup

Setup uses [Virtualenv](https://virtualenv.pypa.io/en/stable/).

```{.sh}
pip3 install virtualenv
virtualenv -p python3 .
source ./bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install jupyter
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