#! /bin/bash
echo '开始验证'
pod spec lint MDPreLayoutKit.podspec --use-libraries --allow-warnings --verbose
echo '开始推送'
pod trunk push MDPreLayoutKit.podspec --allow-warnings --use-libraries --verbose
