class ImageUrlBuilder {
  static const String _baseImageUrl = "https://restaurant-api.dicoding.dev/images";

  static String build(String pictureId, {String size = "large"}) {
    return "$_baseImageUrl/$size/$pictureId";
  }
}