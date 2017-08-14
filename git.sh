#!/bin/bash

ll_git() {
	git init
	touch README.md
	git add README.md
	echo -n "输入远程链接地址："
	read remoteUrl
	git remote add origin $remoteUrl
	git add .
	git commit -m "Initial  commit"
	git push origin master --force
}

 echo "是否使用简易操作？(y/n)"
read isShortcut
if [[ $isShortcut = "y" ]]; then
	 echo "输入文件(夹)目录"
	read path
	cd $path
	currentDic=$(pwd)
	if [[ $path = $currentDic ]]; then
		echo "正确进入初始化页面"
		ll_git
	else
		echo "文件目录切换失败，请手动切换到目录文件夹并选择[非简易操作]"
	fi
else
	ll_git
fi
