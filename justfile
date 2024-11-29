set quiet

rime_user_path := "$HOME/Library/Rime/"

test_var:
  echo {{rime_user_path}}

remove_git:
  rm -rf .git/
  rm -rf .github/

patch_rime:
  mv *.yaml {{rime_user_path}}
  mv custom_phrase.txt {{rime_user_path}}
  mv rime.lua {{rime_user_path}}

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
