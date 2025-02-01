import 'package:json_annotation/json_annotation.dart';

part 'change_order_state_dto.g.dart';

@JsonSerializable()
class ChangeOrderStateDto {
  final String? state;

  ChangeOrderStateDto(this.state);



  Map<String, dynamic> toJson() => _$ChangeOrderStateDtoToJson(this);
}
