import '../enum.dart';
import '../model/category.dart';
import '../model/post.dart';
import '../model/post_category.dart';
import '../model/user.dart';
import '../model/user_category.dart';

User daviddf = User.fromJson({
  'id': 1,
  'name': 'David Dominguez Fondo',
  'creationDate': '2021-01-01T00:00:00.000Z',
  'public': true,
  'role': [Role.admin, Role.user],
  'userStatus': UserStatus.active,
  'usertag': 'daviddf',
  'profileImage': 'https://i.imgur.com/uVJna65.jpeg',
  'badge': ['verified', 'sponsor', 'developer'],
  'biography':
      'I am a software developer. I love to code and I love to learn new things.',
  'url': 'https://daviddf.com',
  'profileBanner': 'https://i.imgur.com/zEpTSB9.jpeg',
  'birthdate': '1990-01-01T00:00:00.000Z'
});

User dagda = User.fromJson({
  'id': 2,
  'name': 'dagda - Social Network',
  'creationDate': '2021-01-01T00:00:00.000Z',
  'public': true,
  'role': [Role.admin, Role.user],
  'userStatus': UserStatus.active,
  'usertag': 'dagda.social',
  'profileImage': 'https://picsum.photos/200/300',
  'badge': ['verified'],
  'biography':
      ' Dagda is a social network that is being developed by David Dominguez Fondo.',
  'url': 'https://dagda.social',
  'profileBanner': 'https://picsum.photos/200/300',
  'birthdate': '1990-01-01T00:00:00.000Z'
});
Post post = Post.fromJson({
  'id': 1,
  'user': daviddf,
  'status': PostStatus.active,
  'contentType': ContentType.post,
  'creationDate': '2021-01-01T00:00:00.000Z',
  'content':
      'Hello World! This is a post example. :) #example #post #hello @dagda.social @daviddf https://github.com/Dagda-Social',
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

Post post4 = Post.fromJson({
  'id': 4,
  'user': daviddf,
  'status': PostStatus.active,
  'contentType': ContentType.image,
  'creationDate': '2021-01-01T00:00:00.000Z',
  'content': {
    'url': 'https://i.imgur.com/uVJna65.jpeg',
  },
  'isTopLevel': true
});

Post post5 = Post.fromJson({
  'id': 5,
  'user': daviddf,
  'status': PostStatus.active,
  'contentType': ContentType.post,
  'creationDate': '2021-01-01T00:00:00.000Z',
  'content':
      'Hello World! This is a post example. :) #example #post #hello @dagda.social @daviddf',
  'isTopLevel': true
});
Post post6 = Post.fromJson({
  'id': 6,
  'user': dagda,
  'status': PostStatus.active,
  'contentType': ContentType.video,
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

UserCategory userCategory2 = UserCategory.fromJson({
  'id': 2,
  'public': true,
  'user': daviddf,
  'category': category2,
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
List<Post> posts = [post, post2, post3, post4, post5, post6];
List<Category> categories = [category1, category2, category3];
List<UserCategory> userCategories = [userCategory1, userCategory2];
List<PostCategory> postCategories = [
  postCategory1,
  postCategory2,
  postCategory3,
  postCategory4
];
