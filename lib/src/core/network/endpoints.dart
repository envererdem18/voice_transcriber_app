enum EndPoint {
  // Audio
  audio('audio/'),
  transcriptions('audio/transcriptions');

  const EndPoint(this.path);
  final String path;
}
