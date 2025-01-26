import 'package:flowery_delivery/features/order_details/data/models/order_details_model.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:geocoding/geocoding.dart';

class OrderDetailsMapper {
  static OrderDetailsEntity toOrderDetailsEntity(OrderDetailsModel model) {
    return OrderDetailsEntity(
      driver: DriverEntity(
        id: model.driver?.id,
        country: model.driver?.country,
        firstName: model.driver?.firstName,
        lastName: model.driver?.lastName,
        vehicleType: model.driver?.vehicleType,
        vehicleNumber: model.driver?.vehicleNumber,
        vehicleLicense: model.driver?.vehicleLicense,
        nid: model.driver?.nID,
        nIDImg: model.driver?.nIDImg,
        email: model.driver?.email,
        gender: model.driver?.gender,
        phone: model.driver?.phone,
        photo: model.driver?.photo,
        createdAt: model.driver?.createdAt,
      ),
      orders: OrderData(
        id: model.orders?.id,
        user: UserData(
          id: model.orders?.user?.id,
          firstName: model.orders?.user?.firstName,
          lastName: model.orders?.user?.lastName,
          email: model.orders?.user?.email,
          gender: model.orders?.user?.gender,
          phone: model.orders?.user?.phone,
          location: Location(
              latitude: model.orders?.user!.location!.latitude ?? 0.0,
              longitude: model.orders?.user!.location!.longitude ?? 0.0,
              timestamp: DateTime.now()),
        ),
        orderItems: model.orders?.orderItems?.map((item) {
          return OrderItems(
            product: item?.product != null
                ? Product(
                    id: item!.product!.id,
                    title: item.product!.title,
                    slug: item.product!.slug,
                    description: item.product!.description,
                    imgCover: item.product!.imgCover,
                    images: item.product!.images,
                    price: item.product!.price,
                    priceAfterDiscount: item.product!.priceAfterDiscount,
                    quantity: item.product!.quantity,
                    category: item.product!.category,
                    occasion: item.product!.occasion,
                    createdAt: item.product!.createdAt,
                    updatedAt: item.product!.updatedAt,
                    discount: item.product!.discount,
                    sold: item.product!.sold,
                  )
                : null,
            price: item?.price,
            quantity: item?.quantity,
            id: item?.id,
          );
        }).toList(),
        totalPrice: model.orders?.totalPrice,
        paymentType: model.orders?.paymentType,
        isPaid: model.orders?.isPaid,
        isDelivered: model.orders?.isDelivered,
        state: model.orders?.state,
        createdAt: model.orders?.createdAt,
        updatedAt: model.orders?.updatedAt,
        orderNumber: model.orders?.orderNumber,
        store: model.orders?.store != null
            ? Store(
                name: model.orders?.store!.name,
                image: model.orders?.store!.image,
                address: model.orders?.store!.address,
                phoneNumber: model.orders?.store!.phoneNumber,
                latLong: model.orders?.store!.latLong,
              )
            : null,
      ),
    );
  }

  static OrderDetailsModel toOrderDetailsModel(OrderDetailsEntity entity) {
    return OrderDetailsModel(
      driver: DriverDto(
        id: entity.driver?.id,
        country: entity.driver?.country,
        firstName: entity.driver?.firstName,
        lastName: entity.driver?.lastName,
        vehicleType: entity.driver?.vehicleType,
        vehicleNumber: entity.driver?.vehicleNumber,
        vehicleLicense: entity.driver?.vehicleLicense,
        nID: entity.driver?.nid,
        nIDImg: entity.driver?.nIDImg,
        email: entity.driver?.email,
        gender: entity.driver?.gender,
        phone: entity.driver?.phone,
        photo: entity.driver?.photo,
        createdAt: entity.driver?.createdAt,
      ),
      orders: OrderDataModel(
        id: entity.orders?.id,
        user: entity.orders?.user != null
            ? UserDataModel(
                id: entity.orders?.user!.id,
                firstName: entity.orders?.user!.firstName,
                lastName: entity.orders?.user!.lastName,
                email: entity.orders?.user!.email,
                gender: entity.orders?.user!.gender,
                phone: entity.orders?.user!.phone,
                location: entity.orders?.user!.location != null
                    ? LocationModel(
                        latitude: entity.orders?.user!.location!.latitude,
                        longitude: entity.orders?.user!.location!.longitude,
                      )
                    : null,
              )
            : null,
        orderItems: entity.orders?.orderItems?.map((item) {
          return OrderItemsModel(
            product: item?.product != null
                ? ProductModel(
                    id: item!.product!.id,
                    title: item.product!.title,
                    slug: item.product!.slug,
                    description: item.product!.description,
                    imgCover: item.product!.imgCover,
                    images: item.product!.images,
                    price: item.product!.price,
                    priceAfterDiscount: item.product!.priceAfterDiscount,
                    quantity: item.product!.quantity,
                    category: item.product!.category,
                    occasion: item.product!.occasion,
                    createdAt: item.product!.createdAt,
                    updatedAt: item.product!.updatedAt,
                    discount: item.product!.discount,
                    sold: item.product!.sold,
                  )
                : null,
            price: item?.price,
            quantity: item?.quantity,
            id: item?.id,
          );
        }).toList(),
        totalPrice: entity.orders?.totalPrice,
        paymentType: entity.orders?.paymentType,
        isPaid: entity.orders?.isPaid,
        isDelivered: entity.orders?.isDelivered,
        state: entity.orders?.state,
        createdAt: entity.orders?.createdAt,
        updatedAt: entity.orders?.updatedAt,
        orderNumber: entity.orders?.orderNumber,
        store: entity.orders?.store != null
            ? StoreModel(
                name: entity.orders?.store!.name,
                image: entity.orders?.store!.image,
                address: entity.orders?.store!.address,
                phoneNumber: entity.orders?.store!.phoneNumber,
                latLong: entity.orders?.store!.latLong,
              )
            : null,
      ),
    );
  }
}
