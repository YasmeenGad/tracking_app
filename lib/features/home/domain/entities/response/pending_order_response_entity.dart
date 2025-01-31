import 'package:equatable/equatable.dart';

class PendingOrderResponseEntity extends Equatable {
  final PendingOrderResponseEntityMetadata? metadata;
  final List<PendingOrderResponseEntityOrders?>? orders;

  const PendingOrderResponseEntity({this.metadata, this.orders});

  @override
  List<Object?> get props => [metadata, orders];
}

class PendingOrderResponseEntityMetadata extends Equatable {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  const PendingOrderResponseEntityMetadata(
      this.currentPage, this.totalPages, this.totalItems, this.limit);

  @override
  List<Object?> get props => [currentPage, totalPages, totalItems, limit];
}

class PendingOrderResponseEntityOrders extends Equatable {
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

  const PendingOrderResponseEntityOrders(
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

  @override
  List<Object?> get props => [
        id,
        user,
        orderItems,
        totalPrice,
        paymentType,
        isPaid,
        isDelivered,
        state,
        createdAt,
        updatedAt,
        orderNumber,
        store
      ];
}

class PendingOrderResponseEntityOrdersUser extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;

  const PendingOrderResponseEntityOrdersUser(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.photo});

  @override
  List<Object?> get props =>
      [id, firstName, lastName, email, gender, phone, photo];
}

class PendingOrderResponseEntityOrdersOrderItems extends Equatable {
  final PendingOrderResponseEntityOrdersOrderItemsProduct? product;
  final int? price;
  final int? quantity;
  final String? id;

  const PendingOrderResponseEntityOrdersOrderItems(
      {this.product, this.price, this.quantity, this.id});

  @override
  List<Object?> get props => [product, price, quantity, id];
}

class PendingOrderResponseEntityOrdersOrderItemsProduct extends Equatable {
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

  const PendingOrderResponseEntityOrdersOrderItemsProduct(
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

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        description,
        imgCover,
        images,
        price,
        priceAfterDiscount,
        quantity,
        category,
        occasion,
        createdAt,
        updatedAt,
        discount,
        sold
      ];
}

class PendingOrderResponseEntityOrdersStore extends Equatable {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  const PendingOrderResponseEntityOrdersStore(
      {this.name, this.image, this.address, this.phoneNumber, this.latLong});

  @override
  List<Object?> get props => [name, image, address, phoneNumber, latLong];
}
