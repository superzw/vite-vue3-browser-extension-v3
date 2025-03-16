#!/bin/bash

# 提交到远程git仓库
commit(){
	# 提交的字符串
	commit_str="commited in `date '+%Y-%m-%d_%H:%M:%S'`"
	
	git add .
	git commit -am "${commit_str}"
	git push origin master
}

# 统计md文件数量
count(){
	echo "    统计*.md文件数："
	find ./ -iname "*.md" | wc -l
}

c(){
	count
}

# 测试
test(){
	echo test
}

# 入口
if [ $# -lt 1 ]; then
	echo ===\>准备执行commit

	commit

	echo "$(tput setaf 2)===>task complete$(tput sgr0)"
elif [ $1 ]; then
	# 参数不是包类型的，当中函数处理
	echo ===\>准备执行${1}函数
	
	func=$1
	$func

	echo "$(tput setaf 2)===>task complete$(tput sgr0)"
fi