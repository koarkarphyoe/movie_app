// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_the_movie_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RetrofitTheMovieApi implements RetrofitTheMovieApi {
  _RetrofitTheMovieApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetNowPlayingResponse> getNowPlayingMovies(
      paramAPIKEY, paramLanguage, paramPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': paramAPIKEY,
      r'language': paramLanguage,
      r'page': paramPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetNowPlayingResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/3/movie/now_playing',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetNowPlayingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetPopularMoviesResponse> getPopularMovies(
      paramAPIKEY, paramLanguage, paramPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': paramAPIKEY,
      r'language': paramLanguage,
      r'page': paramPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetPopularMoviesResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/3/movie/popular',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetPopularMoviesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetActorsResponse> getActors(
      paramAPIKEY, paramLanguage, paramPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': paramAPIKEY,
      r'language': paramLanguage,
      r'page': paramPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetActorsResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/3/person/popular',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetActorsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TopRatedResponse> getTopRated(
      paramAPIKEY, paramLanguage, paramPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': paramAPIKEY,
      r'language': paramLanguage,
      r'page': paramPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TopRatedResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/3/movie/top_rated',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TopRatedResponse.fromJson(_result.data!);
    return value;
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
}
