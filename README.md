# .emacs.d
My emacs configuration file.

## Instalation Guide

In MacOSX, https://emacsformacosx.com/ is a good option. Remember to look in https://emacsformacosx.com/tips to see how to make it runnable from the command line.

1) **Install Cask**

This emacs configuration package use Cask as a package management. See instructions of how to install Cask at <https://github.com/cask/cask/blob/master/README.md>.
On MacOSX, there is the option of install usign homebrew. I would recommend the standard installation, since I had problems in the past with the homebrew instalation.

2) **Download Emacs configuration file**

Download Emacs configuration file from this github repositorie.
```bash
cd ~/
git clone git@github.com:antonior92/.emacs.d.git
# or, alternatively:
# git clone https://github.com/antonior92/.emacs.d.git
```

3) **Use Cask to install the needed packages**

Install all emacs packages needed by this emacs configuration file
```bash
cd ~/.emacs.d
cask install
```

4) ** (Optional) Add cask.el folder to the search path**

Create an symlink to cask folder in home (if not already there):
```bash
ln -s //location//to//cask.el//folder ~/.cask
```

## Features

* **LaTeX support:**
[AuCTeX](https://www.gnu.org/software/auctex/) as a LaTeX enviroment.

* **PDF reader**
I am using [PDFtools](https://github.com/politza/pdf-tools) as PDF reader.
Activate the package in your first initialization of emacs:
```
M-x pdf-tools-install RET
```

* **Magit**
[Magit](https://magit.vc/) as an git interface inside emacs.
