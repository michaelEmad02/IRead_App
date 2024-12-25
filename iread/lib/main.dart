import 'dart:typed_data';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iread/constants.dart';
import 'package:iread/core/entities/book_status_entity.dart';
import 'package:iread/core/services/hive_services.dart';
import 'package:iread/core/services/local_storage_services.dart';
import 'package:iread/core/utils/app_router.dart';
import 'package:iread/core/utils/my_bloc_observer.dart';
import 'package:iread/features/home/data/data_sources/home_local_data_source.dart';
import 'package:iread/features/home/data/repositories/home_repo_implementation.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:iread/features/home/domain/use_cases/fetch_all_books_use_case.dart';
import 'package:iread/features/home/presentation/manager/cubit/fetch_all_books_cubit.dart';
import 'package:iread/features/library/data/data_sources/library_local_data_source.dart';
import 'package:iread/features/library/data/repositories/library_repo_implementation.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(BookStatusEntityAdapter());
  await Hive.openBox<BookEntity>(kLatestBooksBox);
  await Hive.openBox<Uint8List>(kBookImageBox);
  await Hive.openBox<BookStatusEntity>(kBooksStatusBox);
  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(
      homeLocalDataSource: HomeLocalDataSourceImplementation(
          localStorageServices: LocalStorageServices(),
          hiveServices: HiveServices())));
  getItForLibrary.registerSingleton<LibraryRepoImplementation>(
      LibraryRepoImplementation(
          libraryLocalDataSource: LibraryLocalDataSourceImplementation(
              hiveServices: HiveServices())));
  Bloc.observer = MyBlocObserver();
  runApp(const IReadApp());
}

final getIt = GetIt.instance;
final getItForLibrary = GetIt.instance;

class IReadApp extends StatelessWidget {
  const IReadApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchAllBooksCubit(FetchAllBooksUseCase(
              homeRepo: getIt.get<HomeRepoImplementation>()))
            ..fetchAllBooksFiles(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Bookly',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.itimTextTheme(ThemeData.light().textTheme),
        ),
        routerConfig: AppRouter.router,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar", "AE")],
        locale: const Locale("ar", "AE"),
      ),
    );
  }
}
