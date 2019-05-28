#!/bin/bash

# iOSプラグイン開発をXCode上で行えるようにするための開発環境づくり

# 前提:
# Swiftコードのコンパイル、エミュレータ上での実行など、XCode上で行うほうが楽。
# なので、CordovaにiOSプラットフォームを追加させ、そこで自動生成されるxcodeprojファイルを実行する形で
# XCode上での開発を可能にする。

# demoディレクトリに移動する。
# このディレクトリは、プラグインのデモであると同時に、上述のXCode開発を行うための開発環境となる。
# demo/platforms/ios/HelloCordova.xcodeproj
# を実行し、プラグインのコードを修正すると、それをプロジェクトルートのコードに自動的に同期する。
# （この同期処理は、npm scriptsで実行する）

cd demo

cordova platform remove ios

cordova plugin remove cordova-plugin-inappbrowser

# demoプロジェクトに、このプラグイン自体を追加する
# FIXME: 動くがシンボリックリンクが再帰する
cordova plugin add .. --link --nofetch

# iOSプラットフォームの追加。これにより、xcodeprojファイルが生成される
cordova platform add ios
echo "XCodeでの開発を行うには、demo/platforms/ios/HelloCordova.xcodeproj を開いてください。"
echo "npm run watch:syncを実行しておくと、XCode上で修正したコードが自動的にルート以下のファイルに同期されます。"
