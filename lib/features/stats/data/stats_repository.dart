import 'package:fpdart/fpdart.dart';
import 'package:vpn24to7/core/utils/exception_handler.dart';
import 'package:vpn24to7/features/stats/model/stats_failure.dart';
import 'package:vpn24to7/hiddifycore/generated/v2/hcore/hcore.pb.dart';
import 'package:vpn24to7/hiddifycore/hiddify_core_service.dart';
import 'package:vpn24to7/utils/custom_loggers.dart';

abstract interface class StatsRepository {
  Stream<Either<StatsFailure, SystemInfo>> watchStats();
}

class StatsRepositoryImpl with ExceptionHandler, InfraLogger implements StatsRepository {
  StatsRepositoryImpl({required this.singbox});

  final HiddifyCoreService singbox;

  @override
  Stream<Either<StatsFailure, SystemInfo>> watchStats() {
    return singbox.watchStats().handleExceptions(StatsUnexpectedFailure.new);
  }
}
