// *.dart
const appEnv = String.fromEnvironment("APP_ENV", defaultValue: "test");

class AppConfig {
  static bool get isDev => appEnv == 'test';

  static String get app =>
      isDev ? "http://testgbox.fbixfbi.com" : "https://api.gbox.com";
}
