class PaginateResponse<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  PaginateResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginateResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PaginateResponse<T>(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((item) => fromJsonT(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((item) => toJsonT(item)).toList(),
    };
  }
}
