import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path:'../projet_flutter_find_your_movie/.env')
abstract class Env{
  @EnviedField(varName:'API_KEY',obfuscate: true)
  static String apiKey = _Env.apiKey;

  @EnviedField(varName:'BASE_URL',obfuscate: true)
  static String baseUrl = _Env.baseUrl;

  @EnviedField(varName:'IMAGE_BASE_URL',obfuscate: true)
  static String imageBaseUrl = _Env.imageBaseUrl;
}


