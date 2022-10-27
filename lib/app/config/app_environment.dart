class AppEnvironment {
  final String name;
  final String baseUrl;

  const AppEnvironment._({
    required this.name,
    required this.baseUrl,
  });

  static late final AppEnvironment instance;

    factory AppEnvironment.dev() {
    const env = AppEnvironment._(
      name: 'development',
      baseUrl: 'https://api-dev.internpos.com',
    );
    instance = env;

    return env;
  }

  factory AppEnvironment.prod() {
    const env = AppEnvironment._(
      name: 'production',
      baseUrl: 'https://api-dev.internpos.com',
    );
    instance = env;

    return env;
  }
}