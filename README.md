Aiicy Docs
=======

Documentation site for [Aiicy](https://aiicy.org/) 

## Build

```bash
git clone https://github.com/Aiicy/aiicy-docs.git

# init submodule
git submodule init

# pull submodule
git submodule update

# submodule checkout to master branch

cd public && git checkout master
```

## View

```bash
./view.sh
```

Then open [localhost:59000/docs/](http://localhost:59000/docs/)

## New page

```bash
hugo new --kind docs content/en/docs/new.md
```