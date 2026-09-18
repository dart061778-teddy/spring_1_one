# spring_1_one プロジェクトマップ (Project Map)

## 概要
本ドキュメントは、`spring_1_one` プロジェクト全体のディレクトリ構造、パッケージレイアウト、および主要コンポーネント間の連携関係をひと目で把握できるように整理したプロジェクトマップです[cite: 1]。

## 1. ディレクトリ & パッケージ構造 (Directory Structure)
spring_1_one/
├── build.gradle
├── settings.gradle
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/kr/pjtone/
│   │   │       ├── Spring1OneApplication.java   # メインエントリポイント[cite: 1]
│   │   │       ├── MemberController.java        # 会員管理コントローラー[cite: 1]
│   │   │       ├── dao/
│   │   │       │   └── MemberDaoInterface.java  # データアクセスインターフェース[cite: 1]
│   │   │       └── dto/
│   │   │           └── MemberDto.java           # データ転送オブジェクト[cite: 1]
│   │   └── resources/
│   │       ├── application.properties           # 接続・環境設定[cite: 1]
│   │       ├── mybatis/mapper/
│   │       │   └── memberMapper.xml             # MyBatis SQLマッパーファイル[cite: 1]
│   │       ├── static/                          # 静的リソース (JS, CSS, images)[cite: 1]
│   │       └── templates/                       # テンプレートファイル[cite: 1]
│   └── test/java/com/kr/pjtone/
│       └── Spring1OneApplicationTests.java      # 統合テストクラス[cite: 1]
└── docs/                                        # 分析ドキュメント

## 2. URL ルーティング & エンドポイントマップ (Endpoint Map)
| URL パス | 担当コントローラー・メソッド | 実行内容・連携フロー |
| :--- | :--- | :--- |
| `/member/*` (等) | `MemberController`[cite: 1] | 会員情報に関するリクエストを受け付け、DAOおよびMapperを介して処理を実行 |

## 3. レイヤー別コンポーネント連携マップ (Layered Component Map)
- **Presentation Layer (Controller):** `MemberController`[cite: 1]
- **Persistence Layer (Data Access):** `MemberDaoInterface`[cite: 1], `memberMapper.xml` (XML-based MyBatis)[cite: 1]
- **Domain/Data Layer:** `MemberDto`[cite: 1] (Data Transfer Object)
- **Infrastructure / Database:** Spring Boot, MyBatis, Gradle, Java SE 17[cite: 1]