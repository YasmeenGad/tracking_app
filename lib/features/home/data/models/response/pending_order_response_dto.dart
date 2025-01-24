import 'package:json_annotation/json_annotation.dart';

part 'pending_order_response_dto.g.dart';

@JsonSerializable()
class PendingOrderResponseDto {
  final String? message;
  final PendingOrderResponseDtoMetadata? metadata;
  final List<PendingOrderResponseDtoOrders?>? orders;

  PendingOrderResponseDto(this.message, this.metadata, this.orders);

  factory PendingOrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PendingOrderResponseDtoToJson(this);
}

@JsonSerializable()
class PendingOrderResponseDtoMetadata {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  PendingOrderResponseDtoMetadata(
      this.currentPage, this.totalPages, this.totalItems, this.limit);

  factory PendingOrderResponseDtoMetadata.fromJson(Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PendingOrderResponseDtoMetadataToJson(this);
}

@JsonSerializable()
class PendingOrderResponseDtoOrders {
  @JsonKey(name: '_id')
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
  @JsonKey(name: '__v')
  final int? v;
  final PendingOrderResponseDtoOrdersStore? store;

  PendingOrderResponseDtoOrders(
      this.id,
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
      this.v,
      this.store);

  factory PendingOrderResponseDtoOrders.fromJson(Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$PendingOrderResponseDtoOrdersToJson(this);
}

@JsonSerializable()
class PendingOrderResponseDtoOrdersUser {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;

  PendingOrderResponseDtoOrdersUser(this.id, this.firstName, this.lastName,
      this.email, this.gender, this.phone, this.photo);

  factory PendingOrderResponseDtoOrdersUser.fromJson(
          Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoOrdersUserFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PendingOrderResponseDtoOrdersUserToJson(this);
}

@JsonSerializable()
class PendingOrderResponseDtoOrdersOrderItems {
  final PendingOrderResponseDtoOrdersOrderItemsProduct? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  PendingOrderResponseDtoOrdersOrderItems(
      this.product, this.price, this.quantity, this.id);

  factory PendingOrderResponseDtoOrdersOrderItems.fromJson(
          Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoOrdersOrderItemsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PendingOrderResponseDtoOrdersOrderItemsToJson(this);
}

@JsonSerializable()
class PendingOrderResponseDtoOrdersOrderItemsProduct {
  @JsonKey(name: '_id')
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
  @JsonKey(name: '__v')
  final int? v;
  final int? discount;
  final int? sold;

  PendingOrderResponseDtoOrdersOrderItemsProduct(
      this.id,
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
      this.v,
      this.discount,
      this.sold);

  factory PendingOrderResponseDtoOrdersOrderItemsProduct.fromJson(
          Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoOrdersOrderItemsProductFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PendingOrderResponseDtoOrdersOrderItemsProductToJson(this);
}

@JsonSerializable()
class PendingOrderResponseDtoOrdersStore {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  PendingOrderResponseDtoOrdersStore(
      this.name, this.image, this.address, this.phoneNumber, this.latLong);

  factory PendingOrderResponseDtoOrdersStore.fromJson(
          Map<String, dynamic> json) =>
      _$PendingOrderResponseDtoOrdersStoreFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PendingOrderResponseDtoOrdersStoreToJson(this);
}
