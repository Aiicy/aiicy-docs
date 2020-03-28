Aiicy Docs
=======

<p align="center">
  <a href="https://github.com/Aiicy/aiicy-docs/actions?query=workflow%3ACI">
        <img src="https://github.com/Aiicy/aiicy-docs/workflows/CI/badge.svg?branch=master" alt="GitHub Actions">
    </a>
</p>

Documentation site for [Aiicy](https://aiicy.org/) 

## Build

```bash
git clone https://github.com/Aiicy/aiicy-docs.git

cd aiicy-docs

# init submodule
git submodule init

# pull submodule
git submodule update
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