import 'package:get/get.dart';
import 'package:news_app/view/home_screen/home_binding.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:news_app/view/language_selection_screen/language_selection_binding.dart';
import 'package:news_app/view/language_selection_screen/language_selection_screen.dart';

import '../../view/splash/splash_binding.dart';
import '../../view/splash/splash_screen.dart';
import 'routes_name.dart';

/// <<< Routs navigator animation common --------- >>>
GetPage getPage({String? name, GetPageBuilder? page, Bindings? binding}) {
  return GetPage(
    name: name!,
    page: page!,
    binding: binding,
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 400),
  );
}

/// <<< List of all Routs --------- >>>
List<GetPage> pages = [
  getPage(name: RoutesName.splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
  getPage(name: RoutesName.languageScreen, page: () => const LanguageSelectionScreen(), binding: LanguageSelectionBinding()),
  getPage(name: RoutesName.homeScreen, page: () => const HomeScreen(), binding: HomeBinding()),
];
