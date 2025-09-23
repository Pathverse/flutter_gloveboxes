// ignore_for_file: non_constant_identifier_names

class SelfUpdatingMap<K, V> {
  SelfUpdatingMap(
    this._map, [
    List<
      ({
        Function(SelfUpdatingMap<K, V>, K) listener,
        bool onupdate,
        bool onfetch,
        bool ondelete,
      })
    >?
    listeners,
  ]) {
    if (listeners != null) {
      for (final entry in listeners) {
        addListener(
          entry.listener,
          onupdate: entry.onupdate,
          onfetch: entry.onfetch,
          ondelete: entry.ondelete,
        );
      }
    }
  }

  final Map<K, V> _map;
  final List<Function(SelfUpdatingMap<K, V>, K)> _onupdate_listeners = [];
  final List<Function(SelfUpdatingMap<K, V>, K)> _onfetch_listeners = [];
  final List<Function(SelfUpdatingMap<K, V>, K)> _ondelete_listeners = [];

  void addListener(
    Function(SelfUpdatingMap<K, V>, K) listener, {
    bool onupdate = true,
    bool onfetch = true,
    bool ondelete = true,
  }) {
    if (onupdate) {
      _onupdate_listeners.add(listener);
    }
    if (onfetch) {
      _onfetch_listeners.add(listener);
    }
    if (ondelete) {
      _ondelete_listeners.add(listener);
    }
  }

  V operator [](Object? key) {
    final value = _map[key] as V;
    for (var listener in _onfetch_listeners) {
      listener(this, key as K);
    }
    return value;
  }

  void operator []=(K key, V value) {
    _map[key] = value;
    for (var listener in _onupdate_listeners) {
      listener(this, key);
    }
  }

  void remove(K key) {
    _map.remove(key);
    for (var listener in _ondelete_listeners) {
      listener(this, key);
    }
  }

  void clear() {
    for (var key in _map.keys) {
      for (var listener in _ondelete_listeners) {
        listener(this, key);
      }
      remove(key);
    }
  }

  void update(K key, V value) {
    _map[key] = value;
    for (var listener in _onupdate_listeners) {
      listener(this, key);
    }
  }

  Map<K, V> get map => _map;

  Iterable<K> get keys => _map.keys;

  Iterable<V> get values => _map.values;

  bool containsKey(K key) => _map.containsKey(key);

  bool containsValue(V value) => _map.containsValue(value);

  Iterable<MapEntry<K, V>> get entries => _map.entries;
}

SelfUpdatingMap<String, List<String>> DotStrippedStringListMap(
  Map<String, List<String>> map,
) {
  return SelfUpdatingMap<String, List<String>>(map, [
    (
      listener: (map, key) => setDotStrippedStringList(map, key),
      onupdate: true,
      onfetch: false,
      ondelete: false,
    ),
  ]);
}

void setDotStrippedStringList(
  SelfUpdatingMap<String, List<String>> map,
  String key,
) {
  final value = map
      ._map[key]; // Access internal map directly to avoid triggering listeners
  if (value == null) return;

  // Check if any strings actually start with '.' to avoid unnecessary processing
  final needsProcessing = value.any((s) => s.startsWith('.'));
  if (!needsProcessing) return;

  final processed = value
      .map((s) => s.startsWith('.') ? s.substring(1) : s)
      .toList();

  // Update the internal map directly to avoid triggering listeners again
  map._map[key] = processed;
}
