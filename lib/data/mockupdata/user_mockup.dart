import 'package:dagda/data/data.dart';
import 'package:dagda/data/enum.dart';

User daviddf = User.fromJson({
  'id': 1,
  'name': 'David Dominguez',
  'creationDate': '2021-01-01T00:00:00.000Z',
  'public': true,
  'role': [Role.admin, Role.user],
  'userStatus': UserStatus.active,
  'usertag': 'daviddf',
  'profileImage': 'https://i.imgur.com/uVJna65.jpeg',
  'badge': ['verfied', 'sponsor', 'developer'],
  'biography':
      'I am a software developer. I love to code and I love to learn new things.',
  'url': 'https://daviddf.com',
  'profileBanner': 'https://i.imgur.com/zEpTSB9.jpeg',
  'birthdate': '1990-01-01T00:00:00.000Z'
});

Post post = Post.fromJson({
  'id': 1,
  'user': daviddf,
  'status': PostStatus.active,
  'contentType': ContentType.post,
  'creationDate': '2021-01-01T00:00:00.000Z',
  'content': 'Hello World!',
  'isTopLevel': true
});

Post post2 = Post.fromJson({
  'id': 2,
  'user': daviddf,
  'status': PostStatus.active,
  'contentType': ContentType.video,
  'creationDate': '2021-01-01T00:00:00.000Z',
  'content': {
    'url': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  },
  'isTopLevel': true
});

Post post3 = Post.fromJson({
  'id': 3,
  'user': daviddf,
  'status': PostStatus.active,
  'contentType': ContentType.podcast,
  'creationDate': '2021-01-01T00:00:00.000Z',
  'content': {
    'url': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  },
  'isTopLevel': true
});

Category category1 = Category.fromJson({
  'id': 1,
  'name': 'dagda',
  'description': 'Dagda is a social network.',
  'nsfw': false,
  'creator': daviddf,
});

Category category2 = Category.fromJson({
  'id': 2,
  'name': 'flutter',
  'description': 'Flutter is a cross-platform framework.',
  'nsfw': false,
  'creator': daviddf,
});

Category category3 = Category.fromJson({
  'id': 3,
  'name': 'Porn',
  'description': 'This category is for all content that is NSFW.',
  'nsfw': true,
  'creator': daviddf,
});

UserCategory userCategory1 = UserCategory.fromJson({
  'id': 1,
  'public': true,
  'user': daviddf,
  'category': category1,
});

PostCategory postCategory1 = PostCategory.fromJson({
  'id': 1,
  'post': post,
  'category': category1,
});

PostCategory postCategory2 = PostCategory.fromJson({
  'id': 2,
  'post': post,
  'category': category2,
});

PostCategory postCategory3 = PostCategory.fromJson({
  'id': 3,
  'post': post2,
  'category': category2,
});

PostCategory postCategory4 = PostCategory.fromJson({
  'id': 4,
  'post': post3,
  'category': category2,
});
List<Post> posts = [post, post2, post3];
List<Category> categories = [category1, category2, category3];
List<UserCategory> userCategories = [userCategory1];
List<PostCategory> postCategories = [
  postCategory1,
  postCategory2,
  postCategory3,
  postCategory4
];
