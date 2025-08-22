class SourceResponce {
  final String? status;
  final List<Source>? sources;
  final String? code;
  final String? message;

  const SourceResponce({this.status, this.sources, this.code, this.message});

  factory SourceResponce.fromJson(Map<String, dynamic> json) {
    return SourceResponce(
      message: json['message'] as String?,
      code: json['code'] as String?,
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}

class Source {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        category: json['category'] as String?,
        language: json['language'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'url': url,
        'category': category,
        'language': language,
        'country': country,
      };
}
