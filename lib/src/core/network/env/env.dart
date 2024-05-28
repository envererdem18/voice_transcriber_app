import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'openAiKey', obfuscate: true)
  static final String openAiKey = _Env.openAiKey;
}
