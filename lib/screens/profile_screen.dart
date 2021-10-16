import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/screens/custom_drawer.dart';
import 'package:social_media_app/widgets/post_carousal.dart';
import 'package:social_media_app/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _postsPageController;
  late PageController _FavoritesPageController;

  @override
  void initState() {
    _postsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _FavoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 250,
                    width: double.infinity,
                    image: AssetImage(
                      widget.user.backgroundImageUrl!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 15,
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.user.profileImageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              widget.user.name!,
              style: const TextStyle(
                fontSize: 25,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Following",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        //fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.user.following.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        //fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.user.followers.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostCarousel(
              pageController: _postsPageController,
              title: 'Your Posts',
              posts: widget.user.posts!,
            ),
            PostCarousel(
              pageController: _FavoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites!,
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
