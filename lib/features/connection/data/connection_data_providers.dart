import 'package:vpn24to7/core/directories/directories_provider.dart';
import 'package:vpn24to7/features/connection/data/connection_repository.dart';
import 'package:vpn24to7/features/profile/data/profile_data_providers.dart';
import 'package:vpn24to7/features/settings/data/config_option_data_providers.dart';
import 'package:vpn24to7/hiddifycore/hiddify_core_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connection_data_providers.g.dart';

@Riverpod(keepAlive: true)
ConnectionRepository connectionRepository(Ref ref) {
  return ConnectionRepositoryImpl(
    ref: ref,
    directories: ref.watch(appDirectoriesProvider).requireValue,
    configOptionRepository: ref.watch(configOptionRepositoryProvider),
    singbox: ref.watch(hiddifyCoreServiceProvider),
    profilePathResolver: ref.watch(profilePathResolverProvider),
  );
}
