import 'package:geocoding/geocoding.dart';

class OrderDetailsEntity {
  final OrderData? orders;
  final DriverEntity? driver;

  OrderDetailsEntity( { this.driver, this.orders});

}




class OrderData {
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

  OrderData(
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

class UserData {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final Location? location;

  UserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.phone,
        this.location});
}

class OrderItems {
  final Product? product;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItems(
      {this.product, this.price, this.quantity, this.id});
}

class Product {
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

  Product(
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

class Store {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  Store(
      {this.name, this.image, this.address, this.phoneNumber, this.latLong});
}

class DriverEntity {
  DriverEntity({
    this.id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.createdAt,});

  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? createdAt;


}
