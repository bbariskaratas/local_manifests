#!/usr/bin/env bash
set -e

export GIT_AUTHOR_NAME="Crave Patch Script"
export GIT_AUTHOR_EMAIL="crave-patches@example.invalid"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

git -C packages/apps/Aperture fetch https://github.com/CMF-Phone-1/platform_packages_apps_Aperture 1c7dc37dd2721e5207d0eabe988b2c8acd8bf840
git -C packages/apps/Aperture cherry-pick 1c7dc37dd2721e5207d0eabe988b2c8acd8bf840
git -C packages/apps/Aperture fetch https://github.com/CMF-Phone-1/platform_packages_apps_Aperture 00e223c82aa4acf7d15a4e7b556897af19d4a1ff
git -C packages/apps/Aperture cherry-pick 00e223c82aa4acf7d15a4e7b556897af19d4a1ff
git -C frameworks/native fetch https://github.com/Nothing-2A/android_frameworks_native 7b7807349f7b66c61444e32e4a26b025932117d8
git -C frameworks/native cherry-pick 7b7807349f7b66c61444e32e4a26b025932117d8
git -C frameworks/base fetch https://github.com/Nothing-2A/android_frameworks_base 71955520858075bfeb8b52009151ba20401f27e3
git -C frameworks/base cherry-pick 71955520858075bfeb8b52009151ba20401f27e3
git -C system/fs/fs_mgr fetch https://github.com/CMF-Phone-1/android_system_fs_fs_mgr c02c41f0bdfc106ef260125361681076c9c01fee
git -C system/fs/fs_mgr cherry-pick c02c41f0bdfc106ef260125361681076c9c01fee
git -C system/core fetch https://github.com/CMF-Phone-1/platform_system_core 6beb2eaff61ae6d77e07e89629f819cd18feee49
git -C system/core cherry-pick 6beb2eaff61ae6d77e07e89629f819cd18feee49
