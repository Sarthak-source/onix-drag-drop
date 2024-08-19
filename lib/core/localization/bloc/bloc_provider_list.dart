import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reorderlist/core/localization/localization_cubite/localization_cubit.dart';
import 'package:reorderlist/core/responsive_cubite/responsive_cubit.dart';
import 'package:reorderlist/core/widgets/detailed_search_form/cubite/detailed_search_cubite.dart';
import 'package:reorderlist/core/widgets/dragable/cubite/dragable_cubite.dart';

class BlocProviderList {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<LocalizationCubit>(
        create: (context) => LocalizationCubit()..loadSavedLocale(),
      ),
      BlocProvider<ResponsiveCubit>(
        create: (context) => ResponsiveCubit(),
      ),
      BlocProvider<DragDropCubit>(
        create: (context) => DragDropCubit(),
      ),
      BlocProvider<DetailedSearchCubit>(
        create: (context) => DetailedSearchCubit(),
      ),
    ];
  }
}
