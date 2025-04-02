import 'package:json_annotation/json_annotation.dart';


part 'image_model.g.dart';

@JsonSerializable()
class PixelFormImage {
  final String id;
  final String author;
  final int  width;
  final int  height;
  final String url;
  @JsonKey(name: 'download_url')
  final String downloadUrl;

  PixelFormImage({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory PixelFormImage.fromJson(Map<String, dynamic> json) => _$PixelFormImageFromJson(json);

  /// Connect the generated [_$PixelFormImageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixelFormImageToJson(this);
}