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
  //search
  static const String getListSearch = 'v1/api/tim-kiem';
}

class StringConstants {
  static const String homeTitle = 'Trang chủ';
  static const String favouriteTitle = 'Phim yêu thích';
  static const String newestFilm = "Phim mới cập nhật";
  static const String sliderSeeMore = "Xem thêm";
  static const String singleFilm = "Phim lẻ";
  static const String series = "Phim bộ";
  static const String cartoon = "Hoạt hình";
  static const String shows = "TV Shows";
  static const String expand = "Mở rộng";
  static const String zoomOut = "Thu nhỏ";
  static const String keyWord = "Từ khoá";
  static const String resultSearch = "Kết quả tìm kiếm với từ khoá";
  static const String endScreen = "Không có nhiều thêm nữa";
  static const String noResult = "Không có kết quả";
  static const String noInternet = "Không có kết nối mạng";
  static const String checkYourInternet = "Hãy kiểm tra kết nối mạng của bạn";
  static const String tryAgain = "Thử lại";
  static const String typeFilm = "Thể loại";
  static const String contentFilm = "Nội dung";
  static const String actor = "Diễn viên";
  static const String listEpi = "Danh sách tập";
}

class ScreenName {
  static const mainHomeScreen = 'MainHomeScreen';
  static const homeScreen = 'HomeScreen';
  static const searchScreen = 'SearchSreen';
  static const newestFilmScreen = 'NewestFilmScreen';
  static const singleFilmScreen = 'SingleFilmScreen';
  static const seriesFilmScreen = 'SeriesFilmScreen';
  static const cartoonScreen = 'CartoonScreen';
  static const tvshowsScreen = 'TvshowsScreen';
  static const favouriteScreen = 'FavouriteScreen';
  static const playFilmScreen = 'PlayFilmScreen';
}

class ColorConstants {
  static const int primaryOrange = 0xFFfb7b3e;
  static const int lightOrange = 0xFFfff1eb;
  static const int dark = 0xFF44445f;
  static const int gray = 0xFF948c9c;
}
