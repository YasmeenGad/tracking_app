import '../../domain/entities/response/pending_order_response_entity.dart';
import '../models/response/pending_order_response_dto.dart';

class PendingOrdersMapper {
  static PendingOrderResponseEntity toPendingOrderResponseEntity(
      PendingOrderResponseDto dto) {
    return PendingOrderResponseEntity(
      metadata: _mapMetadata(dto.metadata),
      orders: dto.orders?.map(_mapOrder).toList(),
    );
  }

  static PendingOrderResponseEntityMetadata? _mapMetadata(
      PendingOrderResponseDtoMetadata? metadata) {
    if (metadata == null) return null;
    return PendingOrderResponseEntityMetadata(
      metadata.currentPage,
      metadata.totalPages,
      metadata.totalItems,
      metadata.limit,
    );
  }

  static PendingOrderResponseEntityOrders? _mapOrder(
      PendingOrderResponseDtoOrders? order) {
    if (order == null) return null;
    return PendingOrderResponseEntityOrders(
      id: order.id,
      user: _mapUser(order.user),
      orderItems: order.orderItems?.map(_mapOrderItem).toList(),
      totalPrice: order.totalPrice,
      paymentType: order.paymentType,
      isPaid: order.isPaid,
      isDelivered: order.isDelivered,
      state: order.state,
      createdAt: order.createdAt,
      updatedAt: order.updatedAt,
      orderNumber: order.orderNumber,
      store: _mapStore(order.store),
    );
  }

  static PendingOrderResponseEntityOrdersUser? _mapUser(
      PendingOrderResponseDtoOrdersUser? user) {
    if (user == null) return null;
    return PendingOrderResponseEntityOrdersUser(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      gender: user.gender,
      phone: user.phone,
      photo: user.photo,
    );
  }

  static PendingOrderResponseEntityOrdersOrderItems? _mapOrderItem(
      PendingOrderResponseDtoOrdersOrderItems? orderItem) {
    if (orderItem == null) return null;
    return PendingOrderResponseEntityOrdersOrderItems(
      id: orderItem.id,
      price: orderItem.price,
      quantity: orderItem.quantity,
      product: _mapProduct(orderItem.product),
    );
  }

  static PendingOrderResponseEntityOrdersOrderItemsProduct? _mapProduct(
      PendingOrderResponseDtoOrdersOrderItemsProduct? product) {
    if (product == null) return null;
    return PendingOrderResponseEntityOrdersOrderItemsProduct(
      id: product.id,
      title: product.title,
      slug: product.slug,
      description: product.description,
      imgCover: product.imgCover,
      images: product.images,
      price: product.price,
      priceAfterDiscount: product.priceAfterDiscount,
      quantity: product.quantity,
      category: product.category,
      occasion: product.occasion,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
      discount: product.discount,
      sold: product.sold,
    );
  }

  static PendingOrderResponseEntityOrdersStore? _mapStore(
      PendingOrderResponseDtoOrdersStore? store) {
    if (store == null) return null;
    return PendingOrderResponseEntityOrdersStore(
      name: store.name,
      image: store.image,
      address: store.address,
      phoneNumber: store.phoneNumber,
      latLong: store.latLong,
    );
  }
}
