# .emacs.d
My emacs configuration file.

## Instalation Guide

1) **Install Cask**

This emacs configuration package use Cask as a package management. See instructions of how to install Cask at <https://github.com/cask/cask/blob/master/README.md>

2) **Download Emacs configuration file**

Download Emacs configuration file from this github repositorie.
```bash
$ cd ~/
$ git clone --recursive https://github.com/antonior92/.emacs.d.git
```

3) **Use Cask to install the needed packages**

Install all emacs packages needed by this emacs configuration file
```bash
$ cd ~/.emacs.d
$ cask install
```

4) **Add cask.el to the search path**

Create an symlink to cask.el
```bash
$ ln -s //location//to//cask.el ~/.cask
```

5) **Solving Python dependencies**

Since I am using [elpy](https://github.com/jorgenschaefer/elpy) as my Python enviroment some python dependencies may be required.

```bash
$ pip install virtualenv
$ pip install ipython
$ # Either of these
$ pip install rope
$ pip install jedi
$ # flake8 for code checks
$ pip install flake8
$ # importmagic for automatic imports
$ pip install importmagic
$ # and autopep8 for automatic PEP8 formatting
$ pip install autopep8
$ # and yapf for code formatting
$ pip install yapf
```

also make sure the ipython binary is in your $PATH.



