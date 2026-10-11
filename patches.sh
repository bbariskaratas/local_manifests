#!/usr/bin/env bash
set -e

export GIT_AUTHOR_NAME="Crave Patch Script"
export GIT_AUTHOR_EMAIL="crave-patches@example.invalid"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

apply() {  # project path, repository URL, commit SHA
  local project="$1"
  local repository="$2"
  local commit="$3"

  if git -C "$project" log -n 300 --grep="cherry picked from commit $commit" --format=%H | grep -q .; then
    echo "SKIP (already applied): $project $commit"
    return 0
  fi

  git -C "$project" fetch "$repository" "$commit"

  if git -C "$project" cherry-pick -x "$commit"; then
    return 0
  fi

  if [ -n "$(git -C "$project" ls-files -u)" ]; then
    git -C "$project" cherry-pick --abort
    echo "ERROR: cherry-pick conflict in $project for $commit" >&2
    return 1
  fi

  if git -C "$project" diff --cached --quiet; then
    git -C "$project" cherry-pick --skip
    echo "SKIP (patch has no remaining changes): $project $commit"
    return 0
  fi

  git -C "$project" cherry-pick --abort || true
  echo "ERROR: cherry-pick failed in $project for $commit" >&2
  return 1
}

apply packages/apps/Aperture https://github.com/CMF-Phone-1/platform_packages_apps_Aperture 1c7dc37dd2721e5207d0eabe988b2c8acd8bf840
apply packages/apps/Aperture https://github.com/CMF-Phone-1/platform_packages_apps_Aperture 00e223c82aa4acf7d15a4e7b556897af19d4a1ff
apply frameworks/native https://github.com/Nothing-2A/android_frameworks_native 7b7807349f7b66c61444e32e4a26b025932117d8
apply frameworks/base https://github.com/Nothing-2A/android_frameworks_base 71955520858075bfeb8b52009151ba20401f27e3
apply system/fs/fs_mgr https://github.com/CMF-Phone-1/android_system_fs_fs_mgr c02c41f0bdfc106ef260125361681076c9c01fee
apply system/core https://github.com/CMF-Phone-1/platform_system_core 6beb2eaff61ae6d77e07e89629f819cd18feee49
