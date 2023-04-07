#!/bin/bash

# 自動リトライのためのループ
MAX_TRY_TIMES=11
for try_times in $(seq 1 ${MAX_TRY_TIMES});do
    echo "Rundeckステータス確認 [${try_times}回目]"
    rd metrics ping > /dev/null 2>&1
    return_code=$?
    
    # エラーが発生していない場合は、ループを抜けて次へ進む
    if [ ${return_code} -eq 0 ]; then
        echo "Rundeckステータス問題なし"
        break
    fi
    
    echo "Rundeckステータス問題あり"
    
    # 最大リトライ関数に達している場合は、異常終了
    if [ ${try_times} -eq ${MAX_TRY_TIMES} ]; then
        echo ""
        exit 1
    fi
    
    # リトライ前スリープの実行
    sleepsec="$(( 2 ** (${try_times} - 1) ))"
    echo "Rundeckステータス確認 リトライ前スリープ開始  時間： ${sleepsec} 秒"
    sleep ${sleepsec}
    echo "Rundeckステータス確認 リトライ前スリープ終了"
done

# rundeckd サービス再起動
systemctl restart rundeckd

# 自動リトライのためのループ
MAX_TRY_TIMES=11
for try_times in $(seq 1 ${MAX_TRY_TIMES});do
    echo "Rundeckステータス確認 [${try_times}回目]"
    rd metrics ping > /dev/null 2>&1
    return_code=$?
    
    # エラーが発生していない場合は、ループを抜けて次へ進む
    if [ ${return_code} -eq 0 ]; then
        echo "Rundeckステータス問題なし"
        break
    fi
    
    echo "Rundeckステータス問題あり"
    
    # 最大リトライ関数に達している場合は、異常終了
    if [ ${try_times} -eq ${MAX_TRY_TIMES} ]; then
        echo ""
        exit 1
    fi
    
    # リトライ前スリープの実行
    sleepsec="$(( 2 ** (${try_times} - 1) ))"
    echo "Rundeckステータス確認 リトライ前スリープ開始  時間： ${sleepsec} 秒"
    sleep ${sleepsec}
    echo "Rundeckステータス確認 リトライ前スリープ終了"
done

exit 0
