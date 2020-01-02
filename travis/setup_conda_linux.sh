
if [ `uname -m` = 'aarch64' ]; then
   wget -q "https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh" -O archiconda.sh
   chmod +x archiconda.sh
   bash archiconda.sh -b -p $HOME/miniconda
   export PATH="$HOME/miniconda/bin:$PATH"
   sudo cp -r $HOME/miniconda/bin/* /usr/bin/
   hash -r
   sudo conda config --set always_yes yes --set changeps1 no
   sudo conda update -q conda
   sudo conda info -a
   export PKGS="numpy scipy coverage nose pip"
   if [ "$PANDAS_VERSION_STR" != "NONE" ]; then export PKGS="${PKGS} pandas${PANDAS_VERSION_STR}"; fi
   sudo ln -s /home/travis/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
   ls /home/travis/miniconda/bin/ 
   conda activate 
   sudo mkdir $HOME/.condrac
   sudo chmod -R 777 /home/travis/.condarc
   conda info --envs
   sudo conda activate base
else
   wget -q "https://repo.continuum.io/miniconda/Miniconda3-latest-$CONDA_OS.sh" -O miniconda.sh
   chmod +x miniconda.sh
   ./miniconda.sh -b-p $HOME/miniconda
   $HOME/miniconda/bin/conda init bash
   source ~/.bash_profile
   conda activate base

fi
source "$( dirname "${BASH_SOURCE[0]}" )"/setup_dependencies_common.sh
export PATH=$MINICONDA_DIR/bin:$PATH

echo
echo "which conda"
which conda
