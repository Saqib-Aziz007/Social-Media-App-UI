import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/user_model.dart';

class FollowingUser extends StatelessWidget {
  const FollowingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: users.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          User user = users[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  )),
              child: ClipOval(
                child: Image(
                  image: AssetImage(user.profileImageUrl!),
                  //width: 60,
                  //height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
