class AppConstants {
  static const String fontFamily = 'Merriweather';
  static const bool showLog = true;
  static const String apiUrl = 'https://phimapi.com/';
  static const String apiFilmImg = 'https://phimimg.com/';
}

class EndpointApi {
  // danh sách phim mới nhất
  static const String getNewestFilm = 'danh-sach/phim-moi-cap-nhat';
  // thông tin phim
  static const String getDetailFilm = 'phim';
  // danh sách phim lẻ
  static const String getListSingleFilm = 'v1/api/danh-sach/phim-le';
  // danh sách phim bộ
  static const String getListSeries = 'v1/api/danh-sach/phim-bo';
  // danh sách hoạt hình
  static const String getListCartoon = 'v1/api/danh-sach/hoat-hinh';
  // danh sách TV shows
  static const String getListTvShows = 'v1/api/danh-sach/tv-shows';
}

class StringConstants {
  static const String homeTitle = 'Trang chủ';
  static const String newestFilm = "Phim mới cập nhật";
  static const String sliderSeeMore = "Xem thêm";
  static const String singleFilm = "Phim lẻ";
  static const String series = "Phim bộ";
  static const String cartoon = "Hoạt hình";
  static const String shows = "TV Shows";
  static const String expand = "Mở rộng";
  static const String zoomOut = "Thu nhỏ";
}
