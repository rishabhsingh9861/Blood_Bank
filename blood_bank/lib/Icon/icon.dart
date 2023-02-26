import 'dart:convert';


class BloodIcon {
  static List<Bleed> icons = [
    Bleed(
      image: "https://cdn-icons-png.flaticon.com/128/2069/2069755.png",
      name: "Find Blood / Blood Bank / Platelets",
    ),
  ];
}

class Bleed {
  final String image;
  final String name;
  Bleed({
    required this.image,
    required this.name,
  });

  Bleed copyWith({
    String? image,
    String? name,
  }) {
    return Bleed(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
    };
    
  }

  factory Bleed.fromMap(Map<String, dynamic> map) {
    return Bleed(
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bleed.fromJson(String source) =>
      Bleed.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Icon(image: $image, name: $name)';
 
  bool operator ==(covariant Bleed other) {
    if (identical(this, other)) return true;

    return other.image == image && other.name == name;
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode;
}
