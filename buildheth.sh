export PATH=~/bin:~/.cabal/bin:/opt/ghc/7.8.4/bin:$PATH

echo --YOU WILL NEED TO ENTER SOME INFORMATION BEFORE LETTING THIS RUN!--
sleep 2
echo --SO HOLD ON JUST A MINUTE BEFORE WALKING AWAY--
sleep 5 

# Initialize Ubuntu
sudo apt-get update
sudo apt-get -y upgrade

# Get some important tools
sudo apt-get -y install git
sudo apt-get -y install gpgv2

# Install git-repo
mkdir bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

mkdir hask
cd hask

# Setup git-repo and pull the modules.
repo init -u http://github.com/jamshidh/ethereumH
echo --OKAY, NOW YOU CAN GO GET A COFFEE WHILE THIS RUNS.--
sleep 5
repo sync

# Install ghc and cabal
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.20 ghc-7.8.4
sudo apt-get install -y zlib1g-dev
/opt/cabal/1.20/bin/cabal update
/opt/cabal/1.20/bin/cabal install cabal-install
cabal update
cabal install alex happy

# These libraries are required.
sudo apt-get -y install libpq-dev
sudo apt-get -y install libleveldb-dev

sudo ./setup
sudo ./build

# Update PATH
echo "export PATH=~/bin:~/.cabal/bin:/opt/ghc/7.8.4/bin:$PATH" >> ~/.bashrc
source .bashrc
 
