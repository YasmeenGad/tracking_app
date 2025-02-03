import 'package:equatable/equatable.dart';
class DriverOrderEntity extends Equatable {
  final List<DriverOrderList> orders;
final DriverOrderMetadata metadata;
  const DriverOrderEntity( {required this.orders,required this.metadata,});

  @override
  List<Object?> get props => [orders];
}
class DriverOrderMetadata extends Equatable {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int limit;

  const DriverOrderMetadata(
      {required this.currentPage, required this.totalPages, required this.totalItems, required this.limit});

  @override
  List<Object?> get props => [currentPage, totalPages, totalItems, limit];
}

class DriverOrderList extends Equatable {
  final String id;
  final String driverId;
  final OrderEntity order;
  final StoreEntity store;

  const DriverOrderList({
    required this.id,
    required this.driverId,
    required this.order,
    required this.store,
  });

  @override
  List<Object> get props => [id, driverId, order, store];
}

class OrderEntity extends Equatable {
  final String id;
  final UserEntity user;
  final List<OrderItemEntity> orderItems;
  final double totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;
  final String createdAt;
  final String updatedAt;
  final String orderNumber;

  const OrderEntity({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
  });

  @override
  List<Object> get props => [id, user, orderItems, totalPrice, paymentType, isPaid, isDelivered, state, createdAt, updatedAt, orderNumber];
}

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
  });

  @override
  List<Object> get props => [id, firstName, lastName, email, gender, phone, photo];
}

class OrderItemEntity extends Equatable {
  final ProductEntity product;
  final double price;
  final int quantity;

  const OrderItemEntity({
    required this.product,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object> get props => [product, price, quantity];
}

class ProductEntity extends Equatable {
  final String id;
  final double price;

  const ProductEntity({
    required this.id,
    required this.price,
  });

  @override
  List<Object> get props => [id, price];
}

class StoreEntity extends Equatable {
  final String name;
  final String image;
  final String address;
  final String phoneNumber;
  final String latLong;

  const StoreEntity({
    required this.name,
    required this.image,
    required this.address,
    required this.phoneNumber,
    required this.latLong,
  });

  @override
  List<Object> get props => [name, image, address, phoneNumber, latLong];
}


