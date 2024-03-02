import 'dart:async';

import 'package:logger/logger.dart';

Timer debounce({
  required Timer? debouncer,
  Duration duration = const Duration(milliseconds: 500),
  required void Function() callback,
}) {
  if (debouncer != null) {
    debouncer.cancel();
  }

  return Timer(duration, callback);
}

Logger get lgr => Logger();
