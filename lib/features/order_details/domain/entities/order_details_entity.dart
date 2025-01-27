import 'package:equatable/equatable.dart';
import 'package:flowery_delivery/features/profile/domain/entities/response/get_logged_user_driver_response_entity.dart';
import 'package:geocoding/geocoding.dart';

class OrderDetailsEntity extends Equatable {
  final OrderData? orders;
  final DriverEntity? driver;

  const OrderDetailsEntity({this.driver, this.orders});

  @override
  // TODO: implement props
  List<Object?> get props => [driver, orders];
}

class OrderData extends Equatable {
  final String? id;
  final UserData? user;
  final List<OrderItems?>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final Store? store;

  const OrderData(
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
  // TODO: implement props
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

class UserData extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final Location? location;

  const UserData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.location});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, firstName, lastName, email, gender, phone, location];
}

class OrderItems extends Equatable {
  final Product? product;
  final int? price;
  final int? quantity;
  final String? id;

  const OrderItems({this.product, this.price, this.quantity, this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [product, price, quantity, id];
}

class Product extends Equatable {
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

  const Product(
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
  // TODO: implement props
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

class Store extends Equatable {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  const Store({this.name, this.image, this.address, this.phoneNumber, this.latLong});

  @override
  // TODO: implement props
  List<Object?> get props => [name, image, address, phoneNumber, latLong];
}
