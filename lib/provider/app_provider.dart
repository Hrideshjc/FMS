import 'package:VMS/module/home_page/home_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:VMS/theme/theme.dart';

import '../language/language_state.dart';
import '../module/authentication/auth_state/auth_state.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => AuthState(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => HomeState(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => LanguageState(),
    ),
    ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
  ];
}
