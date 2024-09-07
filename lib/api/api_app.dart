import 'dart:convert';

import 'package:http/http.dart';
import 'package:movye/api/api_factory.dart';
import 'package:movye/helper/api_helper.dart';
import 'package:movye/models/film_model.dart';

import '../constants/app_constants.dart';
import '../helper/log_helper.dart';

class HandleResponseApi {
  static Future<List<FilmModel>> handleApiListNewestFilm(
      {required int page}) async {
    Map<String, String?> params = {
      'page': '$page',
    };
    try {
      final res = await AppApi.getListNewestFilm(params);
      if (ApiHelper.isApiResponseSuccess(res)) {
        final resBody = jsonDecode(res?.body ?? '');
        List<dynamic> listData = resBody['items'];
        List<FilmModel> listFilm =
            listData.map((e) => FilmModel.fromJson(e)).toList();
        return listFilm;
      }
      return [];
    } catch (e, s) {
      LogHelper.logCatch(e: e, s: s, tag: 'Get list newest film error');
    }
    return [];
  }

  static Future<List<FilmModel>> handleApiListSingleFilm(
      {required int page, required int limit}) async {
    Map<String, String?> params = {
      'page': '$page',
      'limit': '$limit',
    };
    try {
      final res = await AppApi.getListSingleFilm(params);
      if (ApiHelper.isApiResponseSuccess(res)) {
        final resBody = jsonDecode(res?.body ?? '');
        final data = resBody['data'];
        List<dynamic> listItems = data['items'];
        List<FilmModel> listFilm =
            listItems.map((e) => FilmModel.fromJson(e)).toList();
        return listFilm;
      }
      return [];
    } catch (e, s) {
      LogHelper.logCatch(e: e, s: s, tag: 'Get list single film error');
    }
    return [];
  }

  static Future<List<FilmModel>> handleApiListSeries(
      {required int page, required int limit}) async {
    Map<String, String?> params = {
      'page': '$page',
      'limit': '$limit',
    };
    try {
      final res = await AppApi.getListSeries(params);
      if (ApiHelper.isApiResponseSuccess(res)) {
        final resBody = jsonDecode(res?.body ?? '');
        final data = resBody['data'];
        List<dynamic> listItems = data['items'];
        List<FilmModel> listFilm =
            listItems.map((e) => FilmModel.fromJson(e)).toList();
        return listFilm;
      }
      return [];
    } catch (e, s) {
      LogHelper.logCatch(e: e, s: s, tag: 'Get list series film error');
    }
    return [];
  }

  static Future<List<FilmModel>> handleApiListCartoon(
      {required int page, required int limit}) async {
    Map<String, String?> params = {
      'page': '$page',
      'limit': '$limit',
    };
    try {
      final res = await AppApi.getListCartoon(params);
      if (ApiHelper.isApiResponseSuccess(res)) {
        final resBody = jsonDecode(res?.body ?? '');
        final data = resBody['data'];
        List<dynamic> listItems = data['items'];
        List<FilmModel> listFilm =
            listItems.map((e) => FilmModel.fromJson(e)).toList();
        return listFilm;
      }
      return [];
    } catch (e, s) {
      LogHelper.logCatch(e: e, s: s, tag: 'Get list cartoon error');
    }
    return [];
  }

  static Future<List<FilmModel>> handleApiListTVShows(
      {required int page, required int limit}) async {
    Map<String, String?> params = {
      'page': '$page',
      'limit': '$limit',
    };
    try {
      final res = await AppApi.getListTVShows(params);
      if (ApiHelper.isApiResponseSuccess(res)) {
        final resBody = jsonDecode(res?.body ?? '');
        final data = resBody['data'];
        List<dynamic> listItems = data['items'];
        List<FilmModel> listFilm =
            listItems.map((e) => FilmModel.fromJson(e)).toList();
        return listFilm;
      }
      return [];
    } catch (e, s) {
      LogHelper.logCatch(e: e, s: s, tag: 'Get list TVShows error');
    }
    return [];
  }

  static Future<List<FilmModel>> handleApiListSearch(
      {required int limit, required String keyword}) async {
    Map<String, String?> params = {
      'limit': '$limit',
      'keyword': keyword,
    };
    try {
      final res = await AppApi.getListFilmSearch(params);
      if (ApiHelper.isApiResponseSuccess(res)) {
        final resBody = jsonDecode(res?.body ?? '');
        final data = resBody['data'];
        List<dynamic> listItems = data['items'];
        List<FilmModel> listFilm =
            listItems.map((e) => FilmModel.fromJson(e)).toList();
        return listFilm;
      }
      return [];
    } catch (e, s) {
      LogHelper.logCatch(e: e, s: s, tag: 'Get list search error');
    }
    return [];
  }
}

class AppApi {
  static Future<Response?> getListNewestFilm(param) async {
    const String url = EndpointApi.getNewestFilm;
    final response = await ApiFactory.apiInstance.get(url, param);
    return response;
  }

  static Future<Response?> getListSingleFilm(param) async {
    const String url = EndpointApi.getListSingleFilm;
    final response = await ApiFactory.apiInstance.get(url, param);
    return response;
  }

  static Future<Response?> getListSeries(param) async {
    const String url = EndpointApi.getListSeries;
    final response = await ApiFactory.apiInstance.get(url, param);
    return response;
  }

  static Future<Response?> getListCartoon(param) async {
    const String url = EndpointApi.getListCartoon;
    final response = await ApiFactory.apiInstance.get(url, param);
    return response;
  }

  static Future<Response?> getListTVShows(param) async {
    const String url = EndpointApi.getListTvShows;
    final response = await ApiFactory.apiInstance.get(url, param);
    return response;
  }

  static Future<Response?> getListFilmSearch(param) async {
    const String url = EndpointApi.getListSearch;
    final response = await ApiFactory.apiInstance.get(url, param);
    return response;
  }
}
