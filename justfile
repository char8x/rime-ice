set quiet

rime_user_path := "$HOME/Library/Rime/"
rime_sys_path := "/Library/Input Methods/Squirrel.app/Contents/SharedSupport"

test_var:
  echo {{rime_user_path}}
  echo {{rime_sys_path}}

remove_git:
  rm -rf .git/
  rm -rf .github/

patch_rime:
  #!/usr/bin/env zsh
  if setopt -o extendedglob; then
    # echo "EXTENDED_GLOB is enabled"
    # Preview for moved files
    ls -d *.yaml~(installation.yaml|squirrel.custom.yaml)
    mv -- *.yaml~(installation.yaml|squirrel.custom.yaml) {{rime_user_path}}
    mv -- custom_phrase.txt {{rime_user_path}}
  else
    echo "EXTENDED_GLOB is disabled"
  fi

g_spare_add_folder
  git sparse-checkout add cn_dicts en_dicts lua opencc

patch_folder:
  rsync -avzi --delete cn_dicts {{rime_user_path}}
  rsync -avzi --delete en_dicts {{rime_user_path}}
  rsync -avzi --delete lua {{rime_user_path}}
  rsync -avzi --delete opencc {{rime_user_path}}
  rm -rf ./cn_dicts
  rm -rf ./en_dicts
  rm -rf ./lua
  rm -rf ./opencc
