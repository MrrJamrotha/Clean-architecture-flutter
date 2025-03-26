import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:job_portal_app/core/constants/app_global_key.dart';
import 'package:job_portal_app/core/di/injection.dart';
import 'package:job_portal_app/core/helper/helper.dart';
import 'package:job_portal_app/core/locale/locale_delegate.dart';
import 'package:job_portal_app/core/service/database_service.dart';
import 'package:job_portal_app/core/theme/app_theme.dart';
import 'package:job_portal_app/presentation/global/application/application_cubit.dart';
import 'package:job_portal_app/presentation/global/application/application_state.dart';
import 'package:job_portal_app/presentation/routes/router.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //setup (DI depenecy injection)
  setupInjector();

  //initialize environment
  await dotenv.load(fileName: ".env");

  //initialize locale delegate
  final byteskey =
      sha256
          .convert(utf8.encode(dotenv.env['PASSWORD_HYDRATED'].toString()))
          .bytes;

  //initialize hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    encryptionCipher: HydratedAesCipher(byteskey),
  );

  //initialize database sql
  di.get<DatabaseService>().database;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApplicationCubit()..loadInitialData(),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationState>(
      builder: (context, state) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
          navigatorKey: navigatorKey,
          localizationsDelegates: [
            LocaleDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en", 'US'),
            Locale("km", 'KH'),
            Locale("zh"),
          ],
          initialRoute: '/',
          locale: getLocale(state.localeCode ?? "en"),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          themeMode: state.isDarkModeTheme ? ThemeMode.dark : ThemeMode.light,
          darkTheme: AppTheme.darkTheme,
          onGenerateRoute: AppNavigator.appRoute,
        );
      },
    );
  }
}
