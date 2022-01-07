class ItemModel {
  int id;
  bool isOfferEnabled;
  String offer;
  String priceBeforeOffer;
  String imagePath;
  String itemName;
  String price;
  int categoryId;

  ItemModel(
      {required this.id,
      required this.isOfferEnabled,
      required this.offer,
      required this.priceBeforeOffer,
      required this.imagePath,
      required this.itemName,
      required this.price,
      required this.categoryId,
      }
      );
}

// sizes in product page
class Sizes {
  bool colored;
  int  size;
  Sizes({required this.size,required this.colored});
}