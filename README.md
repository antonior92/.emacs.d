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

4) **Add cask.el folder to the search path**

Create an symlink to cask.el folder
```bash
$ ln -s //location//to//cask.el//folder ~/.cask
```


) **Solving Python dependencies**

You should hav python installed in order to avoid errors using this emacs configuration.
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

*OBS:* If you don't want to use python you should comment the following lines from "~/.emacs.d/init.el"
```bash
;;  Install elpy-mode
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")
```


## Aditional Features

* **LaTeX support**
[AuCTeX](https://www.gnu.org/software/auctex/) as a LaTeX enviroment.

* **Matlab support**
[Matlab/Emacs integration](http://matlab-emacs.sourceforge.net). Guarantee that "matlab" binary is on your $PATH.

* **Jupyter notebook support**
[Emacs Ipython Notebook](https://github.com/tkf/emacs-ipython-notebook) for read jupyter notebooks from emacs.

