// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingOrderResponseDto _$PendingOrderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PendingOrderResponseDto(
      json['message'] as String?,
      json['metadata'] == null
          ? null
          : PendingOrderResponseDtoMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      (json['orders'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PendingOrderResponseDtoOrders.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PendingOrderResponseDtoToJson(
        PendingOrderResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'orders': instance.orders,
    };

PendingOrderResponseDtoMetadata _$PendingOrderResponseDtoMetadataFromJson(
        Map<String, dynamic> json) =>
    PendingOrderResponseDtoMetadata(
      (json['currentPage'] as num?)?.toInt(),
      (json['totalPages'] as num?)?.toInt(),
      (json['totalItems'] as num?)?.toInt(),
      (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PendingOrderResponseDtoMetadataToJson(
        PendingOrderResponseDtoMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'limit': instance.limit,
    };

PendingOrderResponseDtoOrders _$PendingOrderResponseDtoOrdersFromJson(
        Map<String, dynamic> json) =>
    PendingOrderResponseDtoOrders(
      json['_id'] as String?,
      json['user'] == null
          ? null
          : PendingOrderResponseDtoOrdersUser.fromJson(
              json['user'] as Map<String, dynamic>),
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PendingOrderResponseDtoOrdersOrderItems.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      (json['totalPrice'] as num?)?.toInt(),
      json['paymentType'] as String?,
      json['isPaid'] as bool?,
      json['isDelivered'] as bool?,
      json['state'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['orderNumber'] as String?,
      (json['__v'] as num?)?.toInt(),
      json['store'] == null
          ? null
          : PendingOrderResponseDtoOrdersStore.fromJson(
              json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PendingOrderResponseDtoOrdersToJson(
        PendingOrderResponseDtoOrders instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderNumber': instance.orderNumber,
      '__v': instance.v,
      'store': instance.store,
    };

PendingOrderResponseDtoOrdersUser _$PendingOrderResponseDtoOrdersUserFromJson(
        Map<String, dynamic> json) =>
    PendingOrderResponseDtoOrdersUser(
      json['_id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['gender'] as String?,
      json['phone'] as String?,
      json['photo'] as String?,
    );

Map<String, dynamic> _$PendingOrderResponseDtoOrdersUserToJson(
        PendingOrderResponseDtoOrdersUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
    };

PendingOrderResponseDtoOrdersOrderItems
    _$PendingOrderResponseDtoOrdersOrderItemsFromJson(
            Map<String, dynamic> json) =>
        PendingOrderResponseDtoOrdersOrderItems(
          json['product'] == null
              ? null
              : PendingOrderResponseDtoOrdersOrderItemsProduct.fromJson(
                  json['product'] as Map<String, dynamic>),
          (json['price'] as num?)?.toInt(),
          (json['quantity'] as num?)?.toInt(),
          json['_id'] as String?,
        );

Map<String, dynamic> _$PendingOrderResponseDtoOrdersOrderItemsToJson(
        PendingOrderResponseDtoOrdersOrderItems instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };

PendingOrderResponseDtoOrdersOrderItemsProduct
    _$PendingOrderResponseDtoOrdersOrderItemsProductFromJson(
            Map<String, dynamic> json) =>
        PendingOrderResponseDtoOrdersOrderItemsProduct(
          json['_id'] as String?,
          json['title'] as String?,
          json['slug'] as String?,
          json['description'] as String?,
          json['imgCover'] as String?,
          (json['images'] as List<dynamic>?)?.map((e) => e as String?).toList(),
          (json['price'] as num?)?.toInt(),
          (json['priceAfterDiscount'] as num?)?.toInt(),
          (json['quantity'] as num?)?.toInt(),
          json['category'] as String?,
          json['occasion'] as String?,
          json['createdAt'] as String?,
          json['updatedAt'] as String?,
          (json['__v'] as num?)?.toInt(),
          (json['discount'] as num?)?.toInt(),
          (json['sold'] as num?)?.toInt(),
        );

Map<String, dynamic> _$PendingOrderResponseDtoOrdersOrderItemsProductToJson(
        PendingOrderResponseDtoOrdersOrderItemsProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'discount': instance.discount,
      'sold': instance.sold,
    };

PendingOrderResponseDtoOrdersStore _$PendingOrderResponseDtoOrdersStoreFromJson(
        Map<String, dynamic> json) =>
    PendingOrderResponseDtoOrdersStore(
      json['name'] as String?,
      json['image'] as String?,
      json['address'] as String?,
      json['phoneNumber'] as String?,
      json['latLong'] as String?,
    );

Map<String, dynamic> _$PendingOrderResponseDtoOrdersStoreToJson(
        PendingOrderResponseDtoOrdersStore instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'latLong': instance.latLong,
    };
