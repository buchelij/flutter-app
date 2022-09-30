import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ndsn/models/app_theme.dart';
import 'package:ndsn/models/user.dart';
import 'package:ndsn/models/user_post.dart';
import 'package:ndsn/utils/datetime_utils.dart';
import 'package:readmore/readmore.dart';

import 'package:ndsn/widget/ui_helper.dart';
import 'package:ndsn/widget/comment_widget.dart';


class UserPostPage extends StatefulWidget {
  final UserPostModel post;
  final bool isLiked;
  const UserPostPage({Key? key, required this.post, this.isLiked = false}) : super(key: key);

  @override
  State<UserPostPage> createState() => _UserPostPageState();
}

class _UserPostPageState extends State<UserPostPage>
    with TickerProviderStateMixin {
  late UserPostModel post;
  late AnimationController _controller;
  late AnimationController bodyScrollAnimationController;
  late ScrollController scrollController;
  late Animation<double> scale;
  late Animation<double> appBarSlide;

  bool didFetchComments = false;
  List<Comment>? fetchedComments = [];

  final TextEditingController _commentController = TextEditingController();
  late bool isLiked;

  double headerImageSize = 0;

  @override
  void initState() {
    isLiked = widget.isLiked;
    post = widget.post;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    bodyScrollAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= headerImageSize / 2) {
          if (!bodyScrollAnimationController.isCompleted)
            bodyScrollAnimationController.forward();
        } else {
          if (bodyScrollAnimationController.isCompleted)
            bodyScrollAnimationController.reverse();
        }
      });
    appBarSlide = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: bodyScrollAnimationController,
    ));
    scale = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: _controller,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    bodyScrollAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    headerImageSize = MediaQuery.of(context).size.height / 2.5;
    return ScaleTransition(
      scale: scale,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(post.image != null) buildHeaderImage(),
                    Container(
                      padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                _postAuthorRow(),
                                _userButtonsInteraction(),
                              ],
                            ),
                            buildCaptionBox(),
                            _buildComments(),
                            Divider(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ListTile(
                                title: TextFormField(
                                  controller: _commentController,
                                  decoration: InputDecoration(labelText: 'Write a comment...', focusColor: Theme.of(context).primaryColor),
                                  //onFieldSubmitted:() {} ,
                                ),
                                trailing: OutlineButton(onPressed: (){}, borderSide: BorderSide.none, child: Icon(Icons.send),),
                              ),
                            ),
                          ],
                        ),
                    )

                  ],
                ),
              ),
              AnimatedBuilder(
                animation: appBarSlide,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0.0, -1000 * (1 - appBarSlide.value)),
                    child: Material(
                      elevation: 2,
                      color: AppTheme.black,
                      child: buildHeaderButton(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPostTitle() {
    return Text(
      post.user.name,
      style: AppTheme.headline.copyWith(fontSize: 32),
    );
  }

  Widget buildHeaderImage() {
    double maxHeight = MediaQuery.of(context).size.height;
    double minimumScale = 0.8;
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        _controller.value += detail.primaryDelta! / maxHeight * 2;
      },
      onVerticalDragEnd: (detail) {
        if (scale.value > minimumScale) {
          _controller.reverse();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: headerImageSize,
            child: Hero(
              tag: post.image ?? "",
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: post.image ?? "",
              ),
            ),
          ),
          buildHeaderButton()
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
                imageUrl: widget.post.user.urlImage,
                imageBuilder: (context, imageProvider) =>
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                AppTheme.imgBG, BlendMode.colorBurn)),
                      ),
                    ),
                placeholder: (context, url) =>
                    CircularProgressIndicator(
                      color: AppTheme.ndsnPink,
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        Text(widget.post.user.name, style: AppTheme.username)
      ],
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
              setState(() => {
                isLiked = !isLiked
              })
            },
            label: Icon(
              Icons.thumb_up,
              color: AppTheme.dark_grey,
            ),
            selectedColor: AppTheme.palePink,
          ),
        ),
      ]),
    );
  }

  Widget buildHeaderButton({bool hasTitle = false}) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              margin: const EdgeInsets.all(0),
              child: InkWell(
                onTap: () {
                  if (bodyScrollAnimationController.isCompleted) bodyScrollAnimationController.reverse();
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: hasTitle ? Colors.white : Colors.black,
                  ),
                ),
              ),
              color: hasTitle ? AppTheme.orange : AppTheme.white,
            ),
            //if (hasTitle) Text(event.name, style: AppTheme.title.copyWith(color: Colors.white)),

          ],
        ),
      ),
    );
  }

  Widget buildCaptionBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ReadMoreText(
          widget.post.caption,
          style: AppTheme.subtitle,
          trimLines: 2,
          colorClickableText: AppTheme.palePink,
          trimMode: TrimMode.Line,
          trimCollapsedText: '...Show more',
          trimExpandedText: ' show less',
        ),
        UIHelper.verticalSpace(8),
      ],
    );
  }

  Widget _buildComments() {
    if (this.didFetchComments == false){
      return FutureBuilder<List<Comment>>(
          future: getComments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator());
            this.didFetchComments = true;
            this.fetchedComments = snapshot.data;
            return ListView(
              children: snapshot.data!,
            );
          });
    } else {
      // for optimistic updating
      return ListView(
          children: this.fetchedComments!
      );
    }
  }

  Future<List<Comment>> getComments() async {
    List<Comment> comments = [];
    comments.add(Comment( user: dummyUsers[1], comment: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...", timestamp: DateTime.now().add(const Duration(days: 24))));
    comments.add(Comment( user: dummyUsers[4], comment: "Lorem ipsum dolor sit amet, consectetur.", timestamp: DateTime.now().add(const Duration(days: 24))));
    comments.add(Comment( user: dummyUsers[4], comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", timestamp: DateTime.now().add(const Duration(days: 24))));

    return comments;
  }



}
