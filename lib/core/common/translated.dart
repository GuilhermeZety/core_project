import 'package:core_project/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
AppLocalizations Translated = _Translate.call()!;

// ignore: unused_element
class _Translate {
  static AppLocalizations? call() => globalContext.currentContext != null ? AppLocalizations.of(globalContext.currentContext!) : null;
}