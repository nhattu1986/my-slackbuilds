# Pull a stable branch + patches
BRANCH=main

rm -rf mesa
git clone https://gitlab.freedesktop.org/mesa/mesa.git
# package the source archive and clean up:
( cd mesa 
  git checkout $BRANCH || exit 1
)
HEADISAT="$(cat mesa/.git/packed-refs | grep "refs/remotes/origin/${BRANCH}$" | cut -b1-7)"
# Cleanup.  We're not packing up the whole git repo.
( cd mesa && find . -type d -name ".git*" -exec rm -rf {} \; 2> /dev/null )
DATE=$(date +%Y%m%d)
mv mesa mesa-${BRANCH}_${HEADISAT}
tar cf mesa-${BRANCH}_${HEADISAT}.tar mesa-${BRANCH}_${HEADISAT}
xz -9 mesa-${BRANCH}_${HEADISAT}.tar
rm -rf mesa-${BRANCH}_${HEADISAT}
echo
echo "Mesa branch $BRANCH with HEAD at $HEADISAT packaged as mesa-${BRANCH}_${HEADISAT}.tar.xz"
echo
