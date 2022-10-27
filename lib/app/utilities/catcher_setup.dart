import 'package:catcher/catcher.dart';
import 'package:flutter/foundation.dart';

import 'crashlytics_handler.dart';

class CatcherSetup extends CatcherOptions {
  CatcherSetup(ReportMode reportMode, List<ReportHandler> handlers)
      : super(reportMode, handlers);

  factory CatcherSetup.debug() => CatcherSetup(SilentReportMode(),
      [ConsoleHandler(), if (!kDebugMode) CrashlyticsHandler()]);

  factory CatcherSetup.release() => CatcherSetup(
        SilentReportMode(),
        [
          CrashlyticsHandler()

          /// enable this if you need send report to Sentry
          /// SentryHandler(SentryClient("YOUR_DSN_HERE"))
        ],
      );
}
