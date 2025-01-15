import '../../../domain/entities/request/apply_request_entity.dart';

sealed class ApplyDriverActions {}

class ApplyDriverSubmit extends ApplyDriverActions {
  final ApplyRequestEntity request;

  ApplyDriverSubmit(this.request);
}
