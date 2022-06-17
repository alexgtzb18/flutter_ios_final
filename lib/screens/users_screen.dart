import 'package:flutter/material.dart';
import 'package:flutter_ios_final/data/user_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/User.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreen createState() => _UsersScreen();
}

class _UsersScreen extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 6, 31),
            title: Text('Users List'),
            centerTitle: true,
          ),
          body: Container(
            color: Color.fromARGB(255, 0, 78, 134),
            child: ListView.builder(
              itemCount: FactoryData.users.length,
              itemBuilder: (BuildContext context, int index) =>
                  item(FactoryData.users[index]),
            ),
          )),
    );
  }

  Widget item(User user) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [
        IconSlideAction(
          foregroundColor: Colors.white,
          caption: 'Archive',
          color: Colors.amber,
          icon: Icons.archive,
          onTap: () => print('Archive',),
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              FactoryData.users.removeWhere((element) => element.id == user.id);
            });
          },
        )
      ],
      child: ListTile(
        textColor: Colors.white,
        leading: CachedNetworkImage(
          imageUrl: user.photo,
          imageBuilder: (context, imageProvider) => Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        onTap: () {},
      ),
    );
  }
}
