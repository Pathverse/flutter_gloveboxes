import 'package:pv_assetprovider/lib.dart';

class PVAssetProvider {
  late final String _path;

  PVAssetProvider(this._path) {
    if (_path.endsWith('/')) {
      _path = _path.substring(0, _path.length - 1);
    }
  }
  
  String get path => _path;

  PVAssetProvider operator /(String path) {
    // assert not a file path, must be dir
    assert(!path.contains('.'), 'Path cannot contain .');
    return PVAssetProvider('$_path/$path');
  }

  LazyObject get(String path) {
    return LazyObject('$_path/$path');
  }
}

