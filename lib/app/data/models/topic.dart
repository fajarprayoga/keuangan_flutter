class Topic {
  int? id;
  String? name;
  String? address;
  String? contact;
  String? image;

  Topic({
    this.id,
    this.name,
    this.address,
    this.contact,
    this.image,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json['id'] as int?,
        name: json['name'] as String?,
        address: json['address'] as String?,
        contact: json['contact'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'contact': contact,
        'image': image,
      };
}
