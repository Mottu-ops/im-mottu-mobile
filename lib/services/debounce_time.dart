import 'dart:async';

class DebounceTime<T> {
  T? _value;
  Timer? _timer;
  Duration duration;
  Function(T value) callback;

  DebounceTime(this.duration, this.callback);

  T get value => _value!;

  set value(T val) {
    _value = val;
    cancel();
    _timer = Timer(duration, () {
      callback(_value as T);
    });
  }

  cancel() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
