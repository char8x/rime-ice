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

patch_folder:
  rsync -avzi --stats --info=progress2 cn_dicts {{rime_user_path}}
  rsync -avzi --stats --info=progress2 en_dicts {{rime_user_path}}
  rsync -avzi --stats --info=progress2 lua {{rime_user_path}}
  rsync -avzi --stats --info=progress2 opencc {{rime_user_path}}
  rsync -avzi --stats --info=progress2 others {{rime_user_path}}
  rm -rf ./cn_dicts
  rm -rf ./en_dicts
  rm -rf ./lua
  rm -rf ./opencc
  rm -rf ./others
