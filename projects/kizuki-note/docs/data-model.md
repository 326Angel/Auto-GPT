# データモデル

## Memo

### 項目

id

・UUID

text

・本文

createdAt

・作成日時

updatedAt

・更新日時

## SwiftDataイメージ

@Model
final class Memo {
    var id: UUID
    var text: String
    var createdAt: Date
    var updatedAt: Date
}

## 初期方針

・タイトル無し
・タグ無し
・画像無し
・添付無し
・音声無し

まずは本文だけ保存する。

## 将来拡張

・タグ
・音声
・画像
・AI分類
・AI要約
・SNS変換
