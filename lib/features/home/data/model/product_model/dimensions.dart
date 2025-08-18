class Dimensions {
  final double? width;
  final double? height;
  final int? depth;

  const Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    depth: (json['depth'] as num?)?.toInt(),
  );

  Map<String, dynamic> toJson() => {
    'width': width,
    'height': height,
    'depth': depth,
  };
}
