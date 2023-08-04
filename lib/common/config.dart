enum Environment {
  production,
  staging,
  development,
}

class AppConfig {
  AppConfig({
    required this.domainName,
    required this.clientId,
  });
  final String domainName;
  final String clientId;
}

class AppConfigurations {
  static final Map<Environment, AppConfig> _configurations = {
    Environment.production: AppConfig(
      domainName: '',
      clientId: '',
    ),
    Environment.staging: AppConfig(
      domainName: '',
      clientId: '',
    ),
    Environment.development: AppConfig(
      domainName: 'dev-x4nooh6fddekh6dd.us.auth0.com',
      clientId: 'irWtK3hVBU38LvZDNRFOMgGtBn3J2Hxf',
    ),
  };

  static AppConfig getConfiguration(Environment environment) {
    return _configurations[environment] ??
        _configurations[Environment.development]!;
  }
}

class WebConfig {
  WebConfig({
    required this.domainName,
    required this.clientId,
  });
  final String domainName;
  final String clientId;
}

class WebConfigurations {
  static final Map<Environment, WebConfig> _configurations = {
    Environment.production: WebConfig(
      domainName: '',
      clientId: '',
    ),
    Environment.staging: WebConfig(
      domainName: '',
      clientId: '',
    ),
    Environment.development: WebConfig(
      domainName: 'dev-x4nooh6fddekh6dd.us.auth0.com',
      clientId: 'vfHzlrLh8JuZiz9nUt84HRcar9gBYnB0',
    ),
  };

  static WebConfig getConfiguration(Environment environment) {
    return _configurations[environment] ??
        _configurations[Environment.development]!;
  }
}
