import 'package:vpn24to7/core/preferences/preferences_provider.dart';
import 'package:vpn24to7/features/settings/data/config_option_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_option_data_providers.g.dart';

@Riverpod(keepAlive: true)
ConfigOptionRepository configOptionRepository(Ref ref) {
  return ConfigOptionRepository(
    preferences: ref.watch(sharedPreferencesProvider).requireValue,
    getConfigOptions: () => ref.read(ConfigOptions.singboxConfigOptions),
  );
}
