import 'package:core_project/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
AppLocalizations? Translated() => _Translate.call();

// ignore: unused_element
class _Translate {
  _Translate._();
  static final _Translate _instance = _Translate._();
  factory _Translate() => _Translate._instance;

  static AppLocalizations? call() => globalContext.currentContext != null ? AppLocalizations.of(globalContext.currentContext!) : null;
}