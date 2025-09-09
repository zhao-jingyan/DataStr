#!/bin/zsh
# 批量测试 bin/* 可执行文件 假定bin目录下只有一个可执行文件
# 这是一个在macOS下测试的脚本

cd "$(dirname "$0")"  # 保证在 lab0 目录下执行

testcase_dir="./test_case"
exe="lab0"

echo "开始批量测试..."

total=0
pass=0

for infile in $testcase_dir/test*.in; do
    basename=$(basename "$infile" .in)
    outfile="$testcase_dir/$basename.out"
    tmpfile="$testcase_dir/${basename}.tmp"
    "bin/$exe" < "$infile" > "$tmpfile"
    if diff --strip-trailing-cr -q "$tmpfile" "$outfile" > /dev/null; then
        pass=$((pass+1))
    else
        echo "$basename: 测试未通过"
        diff --strip-trailing-cr "$tmpfile" "$outfile"
    fi
    total=$((total+1))
    rm -f "$tmpfile"
done

echo "共 $total 个用例，通过 $pass 个。"
