
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
   source activate base
   source "$( dirname "${BASH_SOURCE[0]}" )"/setup_dependencies_common.sh
else
   wget -q "https://repo.continuum.io/miniconda/Miniconda3-latest-$CONDA_OS.sh" -O miniconda.sh
   chmod +x miniconda.sh
   ./miniconda.sh -b-p $HOME/miniconda
   $HOME/miniconda/bin/conda init bash
   source ~/.bash_profile
   conda activate base
   source "$( dirname "${BASH_SOURCE[0]}" )"/setup_dependencies_common.sh
fi
export PATH=$MINICONDA_DIR/bin:$PATH

echo
echo "which conda"
which conda
