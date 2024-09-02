SHELL=/bin/bash

# Rime 这个是简体中文吗
rime_user_path=$(HOME)/Library/Rime/
rime_sys_path="/Library/Input Methods/Squirrel.app/Contents/SharedSupport"

test:
	ls $(rime_user_path)
	ls $(rime_sys_path)

patch-squirrel-config:
	cp ./squirrel.yaml $(rime_user_path)
