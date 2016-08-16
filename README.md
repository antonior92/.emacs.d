# .emacs.d
My emacs configuration file.

## Instalation Guide

1) **Install Cask**

This emacs configuration package use Cask as a package management. See instructions of how to install Cask at <https://github.com/cask/cask/blob/master/README.md>

2) **Download Emacs configuration file**

Download Emacs configuration file from this github repositorie.
```bash
cd ~/
git clone --recursive git@github.com:antonior92/.emacs.d.git
# or, alternatively:
# git clone --recursive https://github.com/antonior92/.emacs.d.git
```

3) **Use Cask to install the needed packages**

Install all emacs packages needed by this emacs configuration file
```bash
cd ~/.emacs.d
cask install
```

4) **Add cask.el folder to the search path**

Create an symlink to cask.el folder
```bash
ln -s //location//to//cask.el//folder ~/.cask
```

## Features

* **LaTeX support:**
[AuCTeX](https://www.gnu.org/software/auctex/) as a LaTeX enviroment.

* **Matlab support:**
[Matlab/Emacs integration](http://matlab-emacs.sourceforge.net). 
(Make sure the "matlab" binary is in your $PATH.)

* **Jupyter notebook support:**
[Emacs Ipython Notebook](https://github.com/tkf/emacs-ipython-notebook) for read jupyter notebooks from emacs.

* **Python support**

I am using [elpy](https://github.com/jorgenschaefer/elpy) as my Python enviroment.
Install the required Python packages:

```bash
pip install virtualenv
# Either of these
pip install rope
pip install jedi
# flake8 for code checks
pip install flake8
# importmagic for automatic imports
pip install importmagic
# and autopep8 for automatic PEP8 formatting
pip install autopep8
# and yapf for code formatting
pip install yapf
```
