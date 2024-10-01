class Post {

  final int id;
  final String slug;
  final String title;
  final String url;
  final String content;
  final String image;

  Post({
    required this.id,
    required this.slug,
    required this.title,
    required this.url,
    required this.content,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      url: json['url'],
      content: json['content'],
      image: json['image'],
    );
  }


}