import 'package:auto_route/auto_route.dart';
import 'package:sudocu/router/app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, ),
    AutoRoute(page: MainMenuRoute.page),
    AutoRoute(page: SudokuRoute.page, initial: true),
  ];
}