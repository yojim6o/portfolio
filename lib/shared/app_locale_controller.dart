import 'package:portfolio/shared/app_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/*
class AppLocaleController extends AsyncNotifier<String> {
  final LocaleRepository repository;

  AppLocaleController(this.repository);

  @override
  FutureOr<String> build() {
    return repository.getLocale().first;
  }

  void changeLocale(String newLocale) async {
    await repository.saveLocale(newLocale);
    update((state) => newLocale);
  }
}*/
part 'app_locale_controller.g.dart';

@riverpod
class AppLocaleController extends _$AppLocaleController {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getAppLocale();
  }

  void changeLocale(String newLocale) async {
    await AppSharedPref.setAppLocale(newLocale);
    update((state) => newLocale);
  }
}