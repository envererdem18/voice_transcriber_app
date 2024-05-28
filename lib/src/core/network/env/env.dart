import 'package:envied/envied.dart';

part 'env.g.dart';

// API key is obfuscated using this guide:
// https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'openAiKey', obfuscate: true)
  static final String openAiKey = _Env.openAiKey;
}
