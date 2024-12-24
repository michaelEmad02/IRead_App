import 'package:go_router/go_router.dart';
import 'package:iread/features/home/presentation/views/home_view.dart';
import 'package:iread/features/home/presentation/widgets/pdf_viewer_with_tracking.dart';

class AppRouter {
  static String kHomeView = "/";
  static String kPdfViewerWithTracking = "/PdfViewerWithTracking";
  static final router = GoRouter(routes: [
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kPdfViewerWithTracking,
      builder: (context, state) => PdfViewerWithSpacing(
        filePath: state.extra! as String,
      ),
    ),
  ]);
}
