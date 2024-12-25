import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:iread/features/home/presentation/views/home_view.dart';
import 'package:iread/features/home/presentation/widgets/pdf_viewer_with_tracking.dart';
import 'package:iread/features/library/data/repositories/library_repo_implementation.dart';
import 'package:iread/features/library/domain/use_cases/add_book_use_case.dart';
import 'package:iread/features/library/domain/use_cases/fetch_to_read_books_use_case.dart';
import 'package:iread/features/library/domain/use_cases/remove_book_use_case.dart';
import 'package:iread/features/library/domain/use_cases/update_book_use_case.dart';
import 'package:iread/features/library/presentation/manager/cubit/fetch_to_read_books_cubit.dart';
import 'package:iread/features/library/presentation/manager/cubit/manage_library_books_cubit.dart';
import 'package:iread/features/library/presentation/views/to_read_books_view.dart';

class AppRouter {
  static String kHomeView = "/";
  static String kPdfViewerWithTracking = "/PdfViewerWithTracking";
  static String kToReadBooksView = "/ToReadBooksView";
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
    GoRoute(
      path: kToReadBooksView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FetchToReadBooksCubit(FetchToReadBooksUseCase(
                libraryRepo: GetIt.instance.get<LibraryRepoImplementation>())),
          ),
          BlocProvider(
            create: (context) => ManageLibraryBooksCubit(
                addBookUseCase: AddBookUseCase(
                    libraryRepo:
                        GetIt.instance.get<LibraryRepoImplementation>()),
                removeBookUseCase: RemoveBookUseCase(
                    libraryRepo:
                        GetIt.instance.get<LibraryRepoImplementation>()),
                updateBookUseCase: UpdateBookUseCase(
                    libraryRepo:
                        GetIt.instance.get<LibraryRepoImplementation>())),
          ),
        ],
        child: const ToReadBooksView(),
      ),
    ),
  ]);
}
