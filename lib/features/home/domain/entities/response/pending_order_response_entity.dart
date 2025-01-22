class PendingOrderResponseDto {
  final PendingOrderResponseDtoMetadata? metadata;
  final List<PendingOrderResponseDtoOrders?>? orders;

  PendingOrderResponseDto({this.metadata, this.orders});
}

class PendingOrderResponseDtoMetadata {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  PendingOrderResponseDtoMetadata(
      this.currentPage, this.totalPages, this.totalItems, this.limit);
}

class PendingOrderResponseDtoOrders {
  final String? id;
  final PendingOrderResponseDtoOrdersUser? user;
  final List<PendingOrderResponseDtoOrdersOrderItems?>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final PendingOrderResponseDtoOrdersStore? store;

  PendingOrderResponseDtoOrders(
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

class PendingOrderResponseDtoOrdersUser {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;

  PendingOrderResponseDtoOrdersUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.photo});
}

class PendingOrderResponseDtoOrdersOrderItems {
  final PendingOrderResponseDtoOrdersOrderItemsProduct? product;
  final int? price;
  final int? quantity;
  final String? id;

  PendingOrderResponseDtoOrdersOrderItems(
      {this.product, this.price, this.quantity, this.id});
}

class PendingOrderResponseDtoOrdersOrderItemsProduct {
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

  PendingOrderResponseDtoOrdersOrderItemsProduct(
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

class PendingOrderResponseDtoOrdersStore {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  PendingOrderResponseDtoOrdersStore(
      {this.name, this.image, this.address, this.phoneNumber, this.latLong});
}
