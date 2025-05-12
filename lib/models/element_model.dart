class ElementModel {
  final String symbol;
  final String name;
  final int atomicNumber;
  final double atomicMass;
  final String phase;
  final String source;
  final String bohrModelImage;
  final String bohrModel3D;
  final String? spectralImage;
  final String electronConfiguration;
  final String electronConfigurationSemantic;
  final ImageInfo? image;

  ElementModel({
    required this.symbol,
    required this.name,
    required this.atomicNumber,
    required this.atomicMass,
    required this.phase,
    required this.source,
    required this.bohrModelImage,
    required this.bohrModel3D,
    this.spectralImage,
    required this.electronConfiguration,
    required this.electronConfigurationSemantic,
    this.image,
  });

  // تحويل من JSON إلى كائن
  factory ElementModel.fromJson(Map<String, dynamic> json) {
    return ElementModel(
      symbol: json['Symbol'],
      name: json['Name'],
      atomicNumber: json['Atomic Number'],
      atomicMass:
          (json['Atomic Mass'] as num).toDouble(), // معالجة القيمة الرقمية
      phase: json['Phase'],
      source: json['source'],
      bohrModelImage: json['bohr_model_image'],
      bohrModel3D: json['bohr_model_3d'],
      spectralImage: json['spectral_img'],
      electronConfiguration: json['electron_configuration'],
      electronConfigurationSemantic: json['electron_configuration_semantic'],
      image: json['image'] != null ? ImageInfo.fromJson(json['image']) : null,
    );
  }

  // تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'Symbol': symbol,
      'Name': name,
      'Atomic Number': atomicNumber,
      'Atomic Mass': atomicMass,
      'Phase': phase,
      'source': source,
      'bohr_model_image': bohrModelImage,
      'bohr_model_3d': bohrModel3D,
      'spectral_img': spectralImage,
      'electron_configuration': electronConfiguration,
      'electron_configuration_semantic': electronConfigurationSemantic,
      'image': image?.toJson(),
    };
  }
}

// نموذج لكائن الصورة داخل الـ `ElementModel`
class ImageInfo {
  final String? title;
  final String? url;
  final String? attribution;

  ImageInfo({
    this.title,
    this.url,
    this.attribution,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      title: json['title'],
      url: json['url'],
      attribution: json['attribution'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'attribution': attribution,
    };
  }
}
