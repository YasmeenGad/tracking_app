import 'package:flowery_delivery/features/driver_orders/data/models/response/driver_order_response_dto.dart';
import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';

class DriverOrdersMapper {
  static DriverOrderEntity fromDtoList(DriverOrderResponseDto response) {
    return DriverOrderEntity(
      orders: response.orders?.map(_mapOrderList).toList() ?? [],
      metadata: _mapMetaData(response.metadata!),
    );
  }

  static DriverOrderMetadata _mapMetaData(DriverOrderMetadataDto ordersMetadata) {
    return DriverOrderMetadata(
      totalItems: ordersMetadata.totalItems?.toInt() ?? 0,
      totalPages: ordersMetadata.totalPages?.toInt() ?? 0,
      currentPage: ordersMetadata.currentPage?.toInt() ?? 0,
      limit: ordersMetadata.limit?.toInt() ?? 0,
    );
  }

  static DriverOrderList _mapOrderList(DriverOrdersListDto? dto) {
    return DriverOrderList(
      id: dto?.id ?? '',
      driverId: dto?.driver ?? '',
      order: _mapOrder(dto?.order),
      store: _mapStore(dto?.store),
    );
  }

  static OrderEntity _mapOrder(DriverOrderDto? dto) {
    return OrderEntity(
      id: dto?.id ?? '',
      user: _mapUser(dto?.user),
      orderItems: dto?.orderItems?.map(_mapOrderItem).toList() ?? [],
      totalPrice: dto?.totalPrice?.toDouble() ?? 0.0,
      paymentType: dto?.paymentType ?? '',
      isPaid: dto?.isPaid ?? false,
      isDelivered: dto?.isDelivered ?? false,
      state: dto?.state ?? '',
      createdAt: dto?.createdAt ?? '',
      updatedAt: dto?.updatedAt ?? '',
      orderNumber: dto?.orderNumber ?? '',
    );
  }

  static UserEntity _mapUser(DriverUserDto? dto) {
    return UserEntity(
      id: dto?.id ?? '',
      firstName: dto?.firstName ?? '',
      lastName: dto?.lastName ?? '',
      email: dto?.email ?? '',
      gender: dto?.gender ?? '',
      phone: dto?.phone ?? '',
      photo: dto?.photo ?? '',
    );
  }

  static OrderItemEntity _mapOrderItem(DriverOrderItemsDto? dto) {
    return OrderItemEntity(
      product: _mapProduct(dto?.product),
      price: dto?.price?.toDouble() ?? 0.0,
      quantity: dto?.quantity ?? 0,
    );
  }

  static ProductEntity _mapProduct(DriverOrderItemsProductDto? dto) {
    return ProductEntity(
      id: dto?.id ?? '',
      price: dto?.price?.toDouble() ?? 0.0,
    );
  }

  static StoreEntity _mapStore(DriverStoreDto? dto) {
    return StoreEntity(
      name: dto?.name ?? '',
      image: dto?.image ?? '',
      address: dto?.address ?? '',
      phoneNumber: dto?.phoneNumber ?? '',
      latLong: dto?.latLong ?? '',
    );
  }
}