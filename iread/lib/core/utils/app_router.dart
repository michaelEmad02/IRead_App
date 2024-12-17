import 'package:go_router/go_router.dart';
import 'package:iread/features/home/presentation/views/home_view.dart';

class AppRouter {
  static String kHomeView = "/";
  static final router = GoRouter(routes: [
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
