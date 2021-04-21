
class BaseUrl {
  const BaseUrl([this._locale]);

  final String _locale;

  String get url =>
    _locale != 'en' ? 'https://halalcontrol.lt/$_locale/wp-json/wp/v2/posts/?per_page=100'
        : 'https://halalcontrol.lt/wp-json/wp/v2/posts/?per_page=100';

}
String baseUrl =
    "https://halalcontrol.lt/wp-json/wp/v2/posts/?per_page=100";
// String baseUrl =
//     "https://halalcontrol.lt/wp-json/acf/v3/posts";


