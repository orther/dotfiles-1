#!/bin/sh

cd `dirname $0`
F=`pwd |sed -e "s#$HOME/\?##"`

for P in *
do
  # skip setup
  if [ "$P" = "setup.sh" ]; then continue; fi
  if [ "$P" = "setup-all.sh" ]; then continue; fi
  if [ "$P" = "setup" ]; then continue; fi
  if [ "$P" = "extra" ]; then continue; fi

  # ensure permissions
  chmod -R o-rwx,g-rwx $P

  # skip existing links
  if [ -h "$HOME/.$P" ]; then continue; fi

  # move existing dir out of the way
  if [ -e "$HOME/.$P" ]; then
    if [ -e "$HOME/__$P" ]; then
      echo "want to override $HOME/.$P but backup exists"
      continue;
    fi

    echo -n "Backup "
    mv -v "$HOME/.$P" "$HOME/__$P"
  fi

  # create link
  echo -n "Link "
  ln -v -s "$F/$P" "$HOME/.$P"
done

# KeyRemap4Macbook
TARGET="$HOME/Library/Application Support/KeyRemap4MacBook"
mkdir -p "$TARGET"

for P in extra/KeyRemap4MacBook/*.xml
do
  T=$(basename $P)
  if [ -h "$TARGET/$T" ]; then continue; fi

  if [ -e "$TARGET/$T" ]; then
    if [ -e "$TARGET/__$T" ]; then
      echo "want to override $TARGET/$T but backup exists"
      continue;
    fi

    echo -n "Backup "
    mv -v "$TARGET/$T" "$TARGET/__$T"
  fi

  ln -v -s "$F/$P" "$TARGET/$T"
done
