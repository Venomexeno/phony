enum EnviromentType {
  development,
  production;

  String get configurationFilePath=> ".env.${name.toLowerCase()}";
}