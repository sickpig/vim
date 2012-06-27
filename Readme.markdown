My Personal Vim Settings
=============

Configuration
-----

	git clone git://github.com/sickpig/vim.git /path/to/repo
	cd /path/to/repo
	git submodule init 
	git submodule update
	cd ~
	ln -s /path/to/repo/vimrc .vimrc
	ln -s /path/to/repo/vim .vim

and now celebrate ;) 

if you plan to add new plugins just add new submodule
to your local repo, then if you need to update those 
(custom) submodules just issue:

	git submodule foreach git pull origin master
