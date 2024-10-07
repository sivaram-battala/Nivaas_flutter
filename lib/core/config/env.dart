import 'dart:async';

class Env implements EnvVars {
  Env._();

  factory Env() => _instance;

  static final Env _instance = Env._();

  late EnvVars _vars;

  FutureOr<void> loadVars(EnvVars vars) => _vars = vars;
  @override
  String get apiToken => _vars.apiToken;

  @override
  String get baseURL => _vars.baseURL;

  @override
  String get title => _vars.title;

  @override
  String get bearerToken => _vars.bearerToken;
  
  @override
  // TODO: implement storeBaseUrl
  String get storeBaseUrl => _vars.storeBaseUrl;

}

abstract class EnvVars {
  //URLSd
  String get baseURL; 
  String get storeBaseUrl; // parts model

  String get apiToken;
  String get title;
  String get bearerToken;
}
