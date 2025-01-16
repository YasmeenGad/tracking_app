// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_manager.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiManager implements ApiManager {
  _ApiManager(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://flower.elevateegy.com/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApplyResponseDto> applyDriver(
    String country,
    String firstName,
    String lastName,
    String vechicleType,
    String vechicleNumber,
    File vechicleLicense,
    String nID,
    File nIDImg,
    String email,
    String password,
    String rePassword,
    String gender,
    String phone,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'country',
      country,
    ));
    _data.fields.add(MapEntry(
      'firstName',
      firstName,
    ));
    _data.fields.add(MapEntry(
      'lastName',
      lastName,
    ));
    _data.fields.add(MapEntry(
      'email',
      vechicleType,
    ));
    _data.fields.add(MapEntry(
      'password',
      vechicleNumber,
    ));
    _data.files.add(MapEntry(
      'vehicleLicense',
      MultipartFile.fromFileSync(
        vechicleLicense.path,
        filename: vechicleLicense.path.split(Platform.pathSeparator).last,
        contentType: MediaType.parse('image/jpg'),
      ),
    ));
    _data.fields.add(MapEntry(
      'nID',
      nID,
    ));
    _data.files.add(MapEntry(
      'nIDImg',
      MultipartFile.fromFileSync(
        nIDImg.path,
        filename: nIDImg.path.split(Platform.pathSeparator).last,
        contentType: MediaType.parse('image/jpg'),
      ),
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    _data.fields.add(MapEntry(
      'rePassword',
      rePassword,
    ));
    _data.fields.add(MapEntry(
      'gender',
      gender,
    ));
    _data.fields.add(MapEntry(
      'phone',
      phone,
    ));
    final _options = _setStreamType<ApplyResponseDto>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'api/v1/drivers/apply',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApplyResponseDto _value;
    try {
      _value = ApplyResponseDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
