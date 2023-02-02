/// Creating a list of all the endpoints that the app will use.
enum AppApiPath{
  token,
}

/// Creating a function that will return the value of the enum.
extension Endpoint on AppApiPath {
  String get value {
    switch (this) {
      case AppApiPath.token:
        return 'usuario/token';
    }
  }
}