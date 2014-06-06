dotfiles
========

Dot files based on "Homesick"

To install and use this configurations, you need to install ruby/rubygems first:

    # Install Ruby:
    sudo aptitude install ruby rdoc irb git
    #
    # Download the latest rubygems from: https://rubygems.org/pages/download
    #       In my case was rubygems-2.2.2.tgz
    #
    # Unpack it
    tar xzf rubygems-2.2.2.tgz
    #
    # Enter the folder:
    cd rubygems-2.2.2
    #
    # Install it:
    sudo ruby setup.rb all
    #
    # To install homesick
    sudo gem install homesick
    #
    # To clone a homesick repos
    homesick clone https://github.com/estadaodados/dotfiles.git
    #
    # To list all homesick repositories avaliable
    homesick list
    # p.ex.: dotfiles https://github.com/estadaodados/dotfiles.git
    #
    # To "activate" a repository
    homesick symlink dotfiles
