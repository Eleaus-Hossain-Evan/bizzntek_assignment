import 'dart:async';

class Debounce<Return> {
  Duration debounceDuration;

  final Map<DateTime, Completer> _completers = {};
  Timer? _timer;

  Debounce(this.debounceDuration);

  Future<Return?> run(Future<Return> Function() toRun) async {
    _timer?.cancel();
    _completers.entries.map((e) => e.value).forEach((completer) {
      completer.completeError(_CancelException());
    });
    print('❕ Cancelling previous completer and timer…');

    final now = DateTime.now();
    _completers[now] = Completer();
    _timer = Timer(debounceDuration, () {
      _completers[now]?.complete();
    });

    try {
      await _completers[now]?.future;
      _completers.remove(now);
      print('✅ Will execute toRun…');
      return await toRun();
    } catch (exception) {
      print('❌ Cancelled!');
      _completers.remove(now);
      return null;
    }
  }
}

class _CancelException implements Exception {
  const _CancelException() : super();
}
