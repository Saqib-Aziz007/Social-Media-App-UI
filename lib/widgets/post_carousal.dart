import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/models/post_model.dart';

class PostCarousel extends StatelessWidget {
  const PostCarousel(
      {Key? key,
      required this.pageController,
      required this.title,
      required this.posts})
      : super(key: key);
  final PageController pageController;
  final String title;
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return
        // AnimatedBuilder(
        // animation: pageController,
        // builder: (BuildContext context, Widget? widget) {
        //   double value = 1;
        //   if (pageController.position.haveDimensions) {
        //     value = (pageController.page! - index);
        //     value = (1 - (value.abs() * 0.25)).clamp(0.0, 0.1);
        //   }
        //   return Center(
        //     child: SizedBox(
        //       height: Curves.easeInOut.transform(value) * 400,
        //       child: widget,
        //     ),
        //   );
        // },
        // child:
        Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(post.imageUrl),
              fit: BoxFit.cover,
              height: 400,
              width: 300,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
            decoration: const BoxDecoration(
              color: Colors.white54,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  post.location,
                  style: const TextStyle(
                    //fontSize: 15,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      label: Text(
                        post.likes.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment,
                        //color: Colors.red,
                      ),
                      label: Text(
                        post.comments.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
