## 概要
本ドキュメントは、`spring_1_one` プロジェクトの環境設定およびアプリケーションの実行時パラメータを定義する `application.properties` ファイルを分析したものです。サーバーポート、JSPビューリゾルバー、Oracleデータベース接続、およびMyBatis永続化フレームワークの動作環境を設定します。

## 基本情報
- **ファイルパス:** `src/main/resources/application.properties`
- **アプリケーション名:** `spring_1_one`
- **サーバーポート:** `7001`
- **主要な設定領域:** Web/JSPビュー設定、Oracle JDBC接続設定、MyBatis環境設定

## 処理フローの詳細 (5段階 Web 動作フロー)
1. **設定値の読み込み (Property Loading)**: アプリケーション起動時に Spring Boot が `application.properties` の設定値をパースし、各コンポーネントに注入します。
2. **サーバーポートバインド (Server Port Binding)**: `server.port=7001` により、内蔵Tomcatが指定されたポート番号でリクエスト待ち受け状態になります。
3. **ビューリゾルバー構成 (View Resolver Configuration)**: `spring.mvc.view.prefix` と `suffix` により、コントローラーから返された論理ビュー名を `/WEB-INF/views/*.jsp` の物理パスに変換する基盤を整えます。
4. **データベースコネクションプール初期化 (DB Connection Pool Initialization)**: 指定された Oracle ドライバ、URL、認証情報を基にデータベース接続プールを確立します。
5. **MyBatisおよびマッパー連携設定 (MyBatis & Mapper Setup)**: XMLマッパーの物理位置(`classpath:mybatis/mapper/**/**.xml`)やDTOエイリアス設定(`type-aliases-package`)を適用し、SQLマッピングの準備を完了します。

## 主要構成要素
- **`server.port`**: アプリケーションが稼働するHTTPポートを `7001` に設定。
- **`spring.mvc.view.*`**: JSP テンプレートを使用するためのプレフィックス(`/WEB-INF/views/`)とサフィックス(`.jsp`)を指定。
- **`spring.datasource.*`**: Oracle DB (`1.245.91.227:1522/xe`) 接続のためのドライバ、URL、ユーザー認証情報を設定。
- **`mybatis.mapper-locations`**: MyBatisのSQLが記述されたXMLファイルのパスを指定。
- **`mybatis.type-aliases-package`**: DTOクラスのパッケージ名(`com.kr.pjtone.dto`)を省略してエイリアスとして使用できるように設定。
- **`mybatis.configuration.jdbc-type-for-null`**: クエリの実行結果が `null` である場合に発生するエラーを防ぐため、NULL型マッピングを設定。

## 技術的評価および改善ポイント (Refactoring Notes)
- **環境設定の集中管理:** データベース接続情報やポート設定がプロパティファイルに明確に分離されており、保守性に優れています。
- **セキュリティの考慮:** ハードコーディングされたデータベースパスワード(`1234`)や接続IPがソースコード内に露出しているため、実務環境へのデプロイ時には環境変数や暗号化された設定ファイルの導入によるセキュリティ改善が必要です。
- **MyBatis ヌルハンドリング設定:** `jdbc-type-for-null=NULL` の設定を通じて、クエリ結果のマッピング時に発生し得るデータ型の不一致や例外を事前に防止しています。