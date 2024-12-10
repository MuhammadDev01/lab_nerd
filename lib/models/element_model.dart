class ElementModel {
  int? id;
  String? nameElement;
  String? symbol;
  int? atomicNumber;
  String? description;
  String? imageUrl;

  ElementModel.fromJson(jsonData) {
    id = jsonData['id'];
    nameElement = jsonData['name'];
    symbol = jsonData['symbol'];
    atomicNumber = jsonData['atomic_number'];
    description = jsonData['description'];
    imageUrl = jsonData['image_url'];
  }
}
