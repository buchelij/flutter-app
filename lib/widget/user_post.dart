import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ndsn/models/user_post.dart';
import 'package:ndsn/page/user_post_page.dart';
import 'package:ndsn/widget/ui_helper.dart';
import 'package:readmore/readmore.dart';

import '../models/app_theme.dart';
import '../models/user.dart';

class UserPost extends StatefulWidget {
  final UserPostModel post;

  const UserPost({Key? key, required this.post})
      : super(key: key);

  User get user => post.user;

  String get caption => post.caption;

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _postAuthorRow(),
          _postImage(),
          _userButtonsInteraction(),
          _postCaption(),
          UIHelper.verticalSpace(20)
        ],
      ),
    );
  }

  Widget _postAuthorRow() {
    const double avatarDiameter = 44;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: avatarDiameter,
            height: avatarDiameter,
            decoration: BoxDecoration(
                color: AppTheme.primaryLight, shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(avatarDiameter / 2),
              child: CachedNetworkImage(
                imageUrl: widget.user.urlImage,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            AppTheme.imgBG, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(
                  color: AppTheme.ndsnPink,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        Text(widget.user.name, style: AppTheme.username)
      ],
    );
  }

  //TODO: If no image for post, show title and caption only
  Widget _postImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: widget.post.image ?? "",
      ),
    );
  }

  Widget _userButtonsInteraction() {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            selected: isLiked,
            onSelected: (newValue) => {
              setState(() => {isLiked = !isLiked})
            },
            label: Icon(
              Icons.thumb_up,
              color: AppTheme.dark_grey,
            ),
            selectedColor: AppTheme.palePink,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              _goToPostPage();
            },
            child: Icon(
              Icons.comment,
              color: AppTheme.dark_grey,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _postCaption() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReadMoreText(
              widget.post.caption,
              style: AppTheme.subtitle,
              trimLines: 2,
              colorClickableText: AppTheme.palePink,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Show more',
              trimExpandedText: ' show less',
            ),
          ],
        ),
      ),
    );
  }

  void _goToPostPage() {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: true,
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: UserPostPage(post: widget.post, isLiked: isLiked),
          );
        },
      ),
    );
  }
}
