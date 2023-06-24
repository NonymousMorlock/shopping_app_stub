import 'package:benaiah_okwukwe_anukem/core/common/views/app/providers/user_controller.dart';
import 'package:benaiah_okwukwe_anukem/core/services/injection_container.dart';
import 'package:benaiah_okwukwe_anukem/core/services/router.dart';
import 'package:benaiah_okwukwe_anukem/core/settings/cubit/settings_cubit.dart';
import 'package:benaiah_okwukwe_anukem/core/theme/theme.dart';
import 'package:benaiah_okwukwe_anukem/core/utils/constants.dart';
import 'package:benaiah_okwukwe_anukem/features/onboarding/app/providers/route_notifier.dart';
import 'package:benaiah_okwukwe_anukem/l10n/l10n.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SettingsCubit>(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => sl<RouteNotifier>()..initialize(),
          ),
          ChangeNotifierProvider(create: (_) => sl<UserController>()),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    useMaterial3: true,
                    scaffoldBackgroundColor:
                        state is LightTheme ? null : state.backgroundColour,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
                    colorScheme: ColorScheme.fromSwatch(
                      accentColor: const Color(0xFF13B9FF),
                      primarySwatch: state.primarySwatch,
                    ),
                  ),
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  localizationsDelegates: const [
                    CountryLocalizations.delegate,
                    ...AppLocalizations.localizationsDelegates,
                  ],
                  supportedLocales: const [
                    ...AppLocalizations.supportedLocales,
                    ...kSupportedLocales,
                  ],
                  onGenerateRoute: generateRoute,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
