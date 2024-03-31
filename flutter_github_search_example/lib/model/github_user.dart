class GithubUser {
  const GithubUser({
    required this.login,
    required this.avatarUrl,
  });

  // factoryキーワードは、通常のコンストラクタとは異なる方法でインスタンスを生成するために使用されます。
  // 例えば、外部リソースからインスタンスを生成する場合や、キャッシュされたインスタンスを返す場合など、
  // 特定のインスタンス生成のロジックが必要な場合に使用されます。
  // factoryキーワードが使用されている理由は、外部データからインスタンスを生成するための特別なロジックを提供することにあります。
  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );
  }

  final String login;
  final String avatarUrl;
}

/*
動的な型（dynamic型）は、コンパイル時に型のチェックを行わず、実行時に型のチェックを行う特別な型です。
動的な型を使用すると、変数や式の型がコンパイル時に決定されず、実行時に動的に決定されます。
これにより、様々な型の値を同じ変数に代入したり、異なる型のオブジェクトを操作したりすることができますが、型の安全性が低下する可能性があります。
 */