String getYoutubeThumbnail(String url) {
  final uri = Uri.parse(url);
  return 'https://img.youtube.com/vi/${uri.pathSegments.last}/0.jpg';
}
