class HomePopularStarModel {
  num? id;
  String? name;
  String? url;
  HomePopularStarModel({
    this.url,
    this.name,
    this.id,
  });

  @override
  String toString() {
    return 'HomePopularStarModel{id: $id, name: $name, url: $url}';
  }
}
