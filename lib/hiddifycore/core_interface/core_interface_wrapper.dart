import 'dart:io';

import 'package:vpn24to7/hiddifycore/core_interface/core_interface.dart';
import 'package:vpn24to7/hiddifycore/core_interface/core_interface_desktop.dart';
import 'package:vpn24to7/hiddifycore/core_interface/core_interface_mobile.dart';

CoreInterface getCoreInterface() {
  if (Platform.isAndroid || Platform.isIOS) {
    return CoreInterfaceMobile();
  }
  return CoreInterfaceDesktop();
}
