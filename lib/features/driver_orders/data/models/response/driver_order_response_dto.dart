import 'package:json_annotation/json_annotation.dart';

part 'driver_order_response_dto.g.dart';

@JsonSerializable()
class DriverOrderResponseDto {
  final String? message;
  final DriverOrderMetadataDto? metadata;
  final List<DriverOrdersListDto?>? orders;

  DriverOrderResponseDto(this.message, this.metadata, this.orders);

  factory DriverOrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderResponseDtoFromJson(json);

}

@JsonSerializable()
class DriverOrderMetadataDto {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  DriverOrderMetadataDto(
      this.currentPage, this.totalPages, this.totalItems, this.limit);

  factory DriverOrderMetadataDto.fromJson(Map<String, dynamic> json) =>
      _$DriverOrderMetadataDtoFromJson(json);

}

@JsonSerializable()
class DriverOrdersListDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? driver;
  final DriverOrderDto? order;
  @JsonKey(name: '__v')
  final int? v;
  final String? createdAt;
  final String? updatedAt;
  final DriverStoreDto? store;

  DriverOrdersListDto(this.id, this.driver, this.order, this.v,
      this.createdAt, this.updatedAt, this.store);

  factory DriverOrdersListDto.fromJson(Map<String, dynamic> json) =>
      _$DriverOrdersListDtoFromJson(json);

}

@JsonSerializable()
class DriverOrderDto {
  @JsonKey(name: '_id')
  final String? id;
  final DriverUserDto? user;
  final List<DriverOrderItemsDto?>? orderItems;
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

  DriverOrderDto(
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
      this.v);

  factory DriverOrderDto.fromJson(
          Map<String, dynamic> json) =>
      _$DriverOrderDtoFromJson(json);

}

@JsonSerializable()
class DriverUserDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;

  DriverUserDto(this.id, this.firstName, this.lastName,
      this.email, this.gender, this.phone, this.photo);

  factory DriverUserDto.fromJson(
          Map<String, dynamic> json) =>
      _$DriverUserDtoFromJson(json);

}

@JsonSerializable()
class DriverOrderItemsDto {
  final DriverOrderItemsProductDto? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  DriverOrderItemsDto(
      this.product, this.price, this.quantity, this.id);

  factory DriverOrderItemsDto.fromJson(
          Map<String, dynamic> json) =>
      _$DriverOrderItemsDtoFromJson(json);

}

@JsonSerializable()
class DriverOrderItemsProductDto {
  @JsonKey(name: '_id')
  final String? id;
  final int? price;

  DriverOrderItemsProductDto(this.id, this.price);

  factory DriverOrderItemsProductDto.fromJson(
          Map<String, dynamic> json) =>
      _$DriverOrderItemsProductDtoFromJson(json);

}

@JsonSerializable()
class DriverStoreDto {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  DriverStoreDto(
      this.name, this.image, this.address, this.phoneNumber, this.latLong);

  factory DriverStoreDto.fromJson(
          Map<String, dynamic> json) =>
      _$DriverStoreDtoFromJson(json);

}
