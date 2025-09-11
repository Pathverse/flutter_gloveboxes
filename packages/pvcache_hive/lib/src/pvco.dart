// json encoder
import 'dart:convert';
import 'dart:typed_data';

final JsonDecoder gdecoder = JsonDecoder((Object? key, Object? value) {
  if (value is String && value.startsWith('image::')) {
    final base64Str = value.substring(7);
    final bytes = base64Decode(base64Str);
    return ByteData.view(bytes.buffer);
  }
  return value;
});
final JsonEncoder gencoder = JsonEncoder((dynamic object) {
  if (object is ByteData) {
    var str = 'image::${base64Encode(object.buffer.asUint8List())}';
    return jsonEncode(str);
  }
  return object;
});

abstract class PVCi {
  static PVCi fromJson(dynamic json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();

  dynamic get real;
}

class PVCo implements PVCi {
  final dynamic data;
  late final JsonEncoder encoder;

  PVCo(this.data, {JsonEncoder? encoder}) {
    if (encoder != null) {
      this.encoder =
          (encoder.fuse(gencoder as Converter<String, dynamic>)
              as JsonEncoder?)!;
    } else {
      this.encoder = gencoder;
    }
  }

  static PVCo fromJson(dynamic json) {
    return PVCo(gdecoder.convert(json['data']));
  }

  @override
  Map<String, dynamic> toJson() {
    final data = encoder.convert(this.data);
    return {'data': data};
  }

  @override
  dynamic get real => data;
}
