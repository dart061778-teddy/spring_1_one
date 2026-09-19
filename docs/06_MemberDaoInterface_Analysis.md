## 概要
本ドキュメントは、`spring_1_one` プロジェクトのデータアクセス層である `MemberDaoInterface.java` のソースコードを分析したものです。MyBatisの `@Mapper` アノテーションを活用し、データベースとのインターフェース定義とCRUD操作の抽象メソッドを定義します。

## 基本情報
- **ファイルパス:** `src/main/java/com/kr/pjtone/dao/MemberDaoInterface.java`
- **インターフェース名:** `MemberDaoInterface`
- **付与アノテーション:** `@Mapper`
- **主要な依存関係:** `MemberDto` (`com.kr.pjtone.dto.MemberDto`), `MyBatis` (`@Param`, `List`, `Map`)

## 処理フローの詳細 (5段階 Web 動作フロー)
1. **メソッド呼び出し (Method Invocation)**: コントローラーからDAOインターフェースのメソッド（例: `getMemberList()`）が呼び出されます。
2. **MyBatisプロキシバインド (MyBatis Proxy Binding)**: `@Mapper` アノテーションにより、MyBatisが実行時に動的プロキシを生成し、対応するXMLマッパーのSQL文へとマッピングします。
3. **パラメータ解決 (Parameter Resolution)**: `@Param` アノテーションや `Map` を通じて渡された引数が、SQLステートメントのプレースホルダーへ安全にバインドされます。
4. **データベース実行 (Database Execution)**: Oracle JDBCドライバとデータソースを経由してデータベースサーバーにSQLクエリが送信され、実行結果が取得されます。
5. **結果マッピング・返却 (Result Mapping & Return)**: 取得されたレコードセットが自動的に `MemberDto` や `List<MemberDto>` にマッピングされて呼び出し元に返却されます。

## 主要構成要素およびメソッド一覧
- **`getMemberList()`**: 条件なしですべての会員リストを取得するクエリを呼び出すメソッド。
- **`getMemberListMap(Map<String, Object> map)`**: 検索条件やセレクト値を格納した `Map` を受け取り、動的な条件付きリスト検索を実行するメソッド。
- **`memberSave(MemberDto dto)`**: 新規会員情報のDTOオブジェクトを受け取り、データベースへの登録（Insert）を実行して処理件数を返すメソッド。
- **`getCheckId(@Param("checkId") String id)`**: 指定されたIDの重複有無を確認するための照会を実行するメソッド。
- **`getMemberView(@Param("viewId") String id)`**: 特定のIDを持つ会員の詳細情報を1件取得するメソッド。
- **`memberDelete(@Param("deleteId") String id)`**: 指定されたIDの会員情報を削除するメソッド。

## 技術的評価および改善ポイント (Refactoring Notes)
- **インターフェース駆動型設計:** 実装クラスを別途作成する必要がなく、MyBatisのXMLマッパーと直結されるため、メンテナンス性が非常に高くクリーンな構造になっています。
- **明確なパラメータバインディング:** 単一パラメータに対しても `@Param` アノテーションが適切に付与されており、XML側でのバインド競合や可読性の低下を防いでいます。