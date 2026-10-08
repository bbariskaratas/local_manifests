#!/usr/bin/env bash
set -e

export GIT_AUTHOR_NAME="Crave Patch Script"
export GIT_AUTHOR_EMAIL="crave-patches@example.invalid"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

apply() {  # dizin, repo url, commit
  if git -C "$1" log -n 300 --grep="cherry picked from commit $3" --format=%H | grep -q .; then
    echo "SKIP (already applied): $1 $3"
  else
    git -C "$1" fetch "$2" "$3"
    git -C "$1" cherry-pick -x "$3"
  fi
}

apply packages/apps/Aperture https://github.com/CMF-Phone-1/platform_packages_apps_Aperture 1c7dc37dd2721e5207d0eabe988b2c8acd8bf840
apply packages/apps/Aperture https://github.com/CMF-Phone-1/platform_packages_apps_Aperture 00e223c82aa4acf7d15a4e7b556897af19d4a1ff
apply frameworks/native https://github.com/Nothing-2A/android_frameworks_native 7b7807349f7b66c61444e32e4a26b025932117d8
apply frameworks/base https://github.com/Nothing-2A/android_frameworks_base 71955520858075bfeb8b52009151ba20401f27e3
apply system/fs/fs_mgr https://github.com/CMF-Phone-1/android_system_fs_fs_mgr c02c41f0bdfc106ef260125361681076c9c01fee
apply system/core https://github.com/CMF-Phone-1/platform_system_core 6beb2eaff61ae6d77e07e89629f819cd18feee49
