import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/localization/bloc/bloc_provider_list.dart';
import 'core/localization/locale_key_value.dart';
import 'core/localization/localization_cubite/localization_cubit.dart';
import 'core/localization/localization_cubite/localization_state.dart';
import 'screens/button_screen/button_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviderList.getProviders(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (_, localizationState) {
            Locale locale = const Locale('ar', 'AR'); // Default locale
            if (localizationState is LocalizationChanged) {
              locale = localizationState.locale;
            }
            return GetMaterialApp(
              title: 'Reports',
              debugShowCheckedModeBanner: false,
              translations: LocaleString(), // Set your translations
              locale: locale, // Set default locale to device locale
              fallbackLocale: const Locale('en', 'US'),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              supportedLocales: const [
                Locale('ar'),
                Locale('en'),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: const ButtonScreen(),
            );
          }),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        // Set this false
        buildDefaultDragHandles: false,
        children: <Widget>[
          for (int index = 0; index < _items.length; index++)
            // Wrap using ReorderableDragStartListener
            ReorderableDragStartListener(
              key: Key('$index'),
              index: index,
              child: ListTile(
                tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
                title: Text('Item ${_items[index]}'),
              )
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}