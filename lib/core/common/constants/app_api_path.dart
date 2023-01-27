enum AppApiPath{
  token,
}


extension Endpoint on AppApiPath {
  String get value {
    switch (this) {
      case AppApiPath.token:
        return 'usuario/token';
    }
  }
}