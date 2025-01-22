class PendingOrderResponseEntity {
  final PendingOrderResponseEntityMetadata? metadata;
  final List<PendingOrderResponseEntityOrders?>? orders;

  PendingOrderResponseEntity({this.metadata, this.orders});
}

class PendingOrderResponseEntityMetadata {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  PendingOrderResponseEntityMetadata(
      this.currentPage, this.totalPages, this.totalItems, this.limit);
}

class PendingOrderResponseEntityOrders {
  final String? id;
  final PendingOrderResponseEntityOrdersUser? user;
  final List<PendingOrderResponseEntityOrdersOrderItems?>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final PendingOrderResponseEntityOrdersStore? store;

  PendingOrderResponseEntityOrders(
      {this.id,
      this.user,
      this.orderItems,
      this.totalPrice,
      this.paymentType,
      this.isPaid,
      this.isDelivered,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.orderNumber,
      this.store});
}

class PendingOrderResponseEntityOrdersUser {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;

  PendingOrderResponseEntityOrdersUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.photo});
}

class PendingOrderResponseEntityOrdersOrderItems {
  final PendingOrderResponseEntityOrdersOrderItemsProduct? product;
  final int? price;
  final int? quantity;
  final String? id;

  PendingOrderResponseEntityOrdersOrderItems(
      {this.product, this.price, this.quantity, this.id});
}

class PendingOrderResponseEntityOrdersOrderItemsProduct {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String?>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? discount;
  final int? sold;

  PendingOrderResponseEntityOrdersOrderItemsProduct(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.imgCover,
      this.images,
      this.price,
      this.priceAfterDiscount,
      this.quantity,
      this.category,
      this.occasion,
      this.createdAt,
      this.updatedAt,
      this.discount,
      this.sold});
}

class PendingOrderResponseEntityOrdersStore {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  PendingOrderResponseEntityOrdersStore(
      {this.name, this.image, this.address, this.phoneNumber, this.latLong});
}
