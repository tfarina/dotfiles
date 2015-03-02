#!/bin/bash
#
# http://wiki.dlang.org/Building_DMD#Building_the_sources
#
# http://wiki.dlang.org/Attachment:posix-make-install-dmd.sh
#
#
# posix-make-install-dmd.sh

# install dmd, using FROM and PREFIX env variables.

# Before running this script,
# adjust the FROM and PREFIX (installation) paths below to
# suit your taste and system.

# PREFIX is the root of the installation directory
PREFIX=${PREFIX:=/usr/local/dmd}

# FROM should contain a directory 'dmd' as obtained by, for example,
#  git clone https://github.com/D-Programming-Language/dmd.git
#
# To check that you are pointing FROM at the right location,
#  verify that this directory hierarchy exists:
# ${FROM}/dmd/src
# ${FROM}/dmd/docs
# ${FROM}/dmd/samples
# ${FROM}/dmd/test
# ${FROM}/dmd/VERSION
#
FROM=${FROM:=~/src/d}

OS=${OS:=linux}

# include automated build steps too. For completeness, and
# because the details help people understand the manual steps too.

# do a clean and build first
pushd ${FROM}/dmd/src

make -f posix.mak MODEL=64 clean
make -f posix.mak MODEL=64 DEBUG=1 DMD=../dmd/src/dmd -j 9
cd ../../druntime
make -f posix.mak MODEL=64 clean
make -f posix.mak MODEL=64 DEBUG=1 DMD=../dmd/src/dmd -j 9
cd ../phobos
make -f posix.mak MODEL=64 clean
make -f posix.mak MODEL=64 DEBUG=1 DMD=../dmd/src/dmd -j 9

popd


# some automated checks that FROM is correct:
if [ ! -d ${FROM}/dmd ]
then
  echo "Directory \${FROM}/dmd does not exist: please adjust the value of the FROM variable to point to your DMD source tree. (See notes at top of this file.) Currently FROM is set to: ${FROM}"
   exit 1
 fi

if [ ! -f ${FROM}/dmd/VERSION ]
then
  echo "File \${FROM}/dmd/VERSION does not exist: please adjust the value of the FROM variable to point to your DMD source tree. (See notes at the top of this file.) Currently set to: ${FROM}"
  exit 1
fi

VERSION=$(cat ${FROM}/dmd/VERSION )
echo "Verified that \$FROM (${FROM})"
echo "   contains the source of dmd version ${VERSION}."
echo "We assume it is already built."
echo "   (For build help) Refer to: http://wiki.dlang.org/Building_DMD"
echo "Trying to install now..."
echo "Installing dmd version ${VERSION} to ---> ${PREFIX}"
echo


if [ ! -d ${PREFIX} ]
then
  mkdir -p ${PREFIX}
fi

if [ ! -d ${PREFIX} ]
then
  echo "$0 aborting: could not create PREFIX directory (${PREFIX})"
  exit 1
fi

mkdir -p ${PREFIX}/bin

if [ ! -d ${PREFIX}/bin ]
then
  echo "$0 aborting: could not create PREFIX/bin directory (${PREFIX}/bin)"
  exit 1
fi

mkdir -p ${PREFIX}/lib
mkdir -p ${PREFIX}/include/d2
cp -p ${FROM}/dmd/src/dmd ${PREFIX}/bin

cp -r ${FROM}/druntime/import/* ${PREFIX}/include/d2/

cp -p ${FROM}/phobos/generated/${OS}/release/64/libphobos2.a ${PREFIX}/lib    # for 64-bit version

cp -p ${FROM}/druntime/lib/libdruntime-${OS}64.a ${PREFIX}/lib    # for 64-bit version

cp -r ${FROM}/phobos/std ${PREFIX}/include/d2
cp -r ${FROM}/phobos/etc ${PREFIX}/include/d2



cat << END_TEXT > ${PREFIX}/bin/dmd.conf
[Environment]
DFLAGS=-I${PREFIX}/include/d2 -L-L${PREFIX}/lib -L--no-warn-search-mismatch -L--export-dynamic
END_TEXT


cat << ADD_TO_BASHRC  >> ~/.bashrc

### ... auto added next three lines
### dmd ${VERSION} installed using prefix: ${PREFIX}
export PATH=${PREFIX}/bin:\${PATH}
export LD_LIBRARY_PATH=${PREFIX}/lib:\${LD_LIBRARY_PATH}

ADD_TO_BASHRC

echo "finished installing dmd from ${FROM}  ---> ${PREFIX}"
echo
echo "auto-added dmd to beginning of PATH and LD_LIBRARY_PATH at the end of ~/.bashrc : please check your ~/.bashrc for correctness."
