class OpenseaModel {
  OpenseaModel({
    required this.nfts,
  });
  late final List<Nfts> nfts;

  OpenseaModel.fromJson(Map<String, dynamic> json) {
    nfts = List.from(json['nfts']).map((e) => Nfts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nfts'] = nfts.map((e) => e.toJson()).toList();
    return data;
  }
}

class Nfts {
  Nfts({
    required this.identifier,
    required this.collection,
    required this.name,
    this.description,
    required this.imageUrl,
    this.metadataUrl,
  });

  String? identifier;
  String? collection;
  String? name;
  String? description;
  String? imageUrl;
  String? metadataUrl;

  Nfts.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    collection = json['collection'];
    name = json['name'];
    description = null;
    imageUrl = json['image_url'];
    metadataUrl = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['collection'] = collection;
    data['name'] = name;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['metadata_url'] = metadataUrl;
    return data;
  }
}
