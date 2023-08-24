#!/usr/bin/env bash



WORKSPACE=~/.setuptools_update_tmp

preapre_tmp() {
    cd $HOME

    if [ -e $WORKSPACE ]; then
        rm -rf $WORKSPACE
    fi

    mkdir $WORKSPACE
}

download() {
    echo "⬇️  Downloading latest package..."
    git clone --quiet https://github.com/shotastage/setuptools.sh.git $WORKSPACE/netinst/ >> /dev/null
}

destory_old() {
    rm -rf $HOME/.setuptools/lib/
    rm -rf $HOME/.setuptools/bin/
}

install_new() {
    cp -rf $WORKSPACE/netinst/lib/ $HOME/.setuptools/lib/
    mkdir -p $HOME/.setuptools/bin/
    cp -f $WORKSPACE/netinst/uptool.sh $HOME/.setuptools/bin/uptool
    cp -f $WORKSPACE/netinst/ups.sh $HOME/.setuptools/bin/ups
    cp -f $WORKSPACE/netinst/uptool-update.sh $HOME/.setuptools/bin/uptool-update
    cp -f $WORKSPACE/netinst/setuptools-help.sh $HOME/.setuptools/bin/setuptools-help
}

# PREPARE
cd $HOME

preapre_tmp
download
echo "🔄  Updating UpScripts..."
destory_old
install_new


cd $HOME
rm -rf .setuptools_update_tmp/
echo "🆗  Update completed!"
