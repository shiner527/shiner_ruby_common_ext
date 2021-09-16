#!/usr/bin/env bash

# 作者：Sherlock.Ma（2021-05-27）
#
# 説明：このシェルファイルはリモート側にソースコードをプッシュする際に、まずYARDドキュメント率をチェックしておくこと。
# プッシュそのもの実行するかどうかをYARDパーセントと許可最低限の値を比較する結果次第であること。
#
# 許可範囲最低限のパーセントとイコールまたそれ以上になる場合、プッシュの実行ができる。ではないと実行が中止になること。

# 全部ドキュメントされる率
full_precent=100.00

# 許可範囲最低限のコメント型のYARDドキュメント率設置
allowed_precent=80.00

# パーセントをチェックする
# set -e
cd "${0%/*}/../.."
echo "Running yard"
check_result=$(yard | grep "% documented")
result=$?
all=$*

# パーセントマッチ用の正規表現
reg="[[:space:]]*(1?[[:digit:]]{2}\.[[:digit:]]{2})\%[[:space:]]+documented$"

# 小数比べ用の関数定義
float_compare () {
  local var1=$1
  local var2=$2
  # echo "var1 = ${var1%%.*}.${var1##*.}; var2 = ${var2%%.*}.${var2##*.}"
  # より小さくなる
  if (( ${var1%%.*} < ${var2%%.*} || ( ${var1%%.*} == ${var2%%.*} && ${var1##*.} < ${var2##*.} ) )); then
    # echo info first 'if'
    return 9
  # より大きくなる
  elif (( ${var1%%.*} > ${var2%%.*} || ( ${var1%%.*} == ${var2%%.*} && ${var1##*.} > ${var2##*.} ) )); then
    # echo info second 'elif'
    return 1
  # イコール
  else
    # echo into third 'else'
    return 0
  fi
}

# 実行成功する場合
if [ $result -eq 0 ] && [[ $check_result =~ $reg ]]; then
  precent=${BASH_REMATCH[1]}
  msg="Documented precent: $precent%"
  echo -e "\033[0;32mRun yard successfully!\033[0m"
  float_compare "$precent" "$full_precent"
  compare_full=$?
  float_compare "$precent" "$allowed_precent"
  compare_allowed=$?
  # 確率比較の結果によって、全部カバーの場合
  if (( "$compare_full" == 0 )); then
    echo -e "\033[1;32m$msg. Conguratuations! The project is fully documented!\033[0m"
  # 部分的にカバーけれども、また最低限に以上の場合
  elif (( "$compare_allowed" == 1 )); then
    echo -e "\033[1;33m$msg. Level is still allowed well the project is not fully documented.\033[0m"
  else # 全然及ばない場合
    echo -e "\033[0;31m$msg. The project should be doucmented over $allowed_precent%!\033[0m"
    exit 1
  fi
# 実行失敗する場合
else
  echo -e "\033[0;31mYard chechking must be checked successfully before pushing code!"
  exit 1
fi
