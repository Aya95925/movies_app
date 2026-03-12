class Torrent {
  final String quality;
  final String type;
  final String size;
  final int seeds;
  final int peers;
  final String url;

  const Torrent({
    required this.quality,
    required this.type,
    required this.size,
    required this.seeds,
    required this.peers,
    required this.url,
  });
}
