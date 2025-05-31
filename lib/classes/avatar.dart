class Avatar {
  final String filename;
  final int id;
  final String mimeType;
  final int size;
  final String uploadDate;
  final String url;

  Avatar({
    required this.filename,
    required this.id,
    required this.mimeType,
    required this.size,
    required this.uploadDate,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      filename: json['filename'] as String,
      id: json['id'] as int,
      mimeType: json['mime_type'] as String,
      size: json['size'] as int,
      uploadDate: json['upload_date'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'id': id,
      'mime_type': mimeType,
      'size': size,
      'upload_date': uploadDate,
      'url': url,
    };
  }
  
  @override
  String toString() {
    return 'Avatar(id: $id, url: $url)';
  }
}
