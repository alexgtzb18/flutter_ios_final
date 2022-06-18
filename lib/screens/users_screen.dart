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
  List userList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    dynamic resultant = await User().getUsersList();
    if (resultant == null) {
      print("Error en fetch");
    } else {
      setState(() {
        userList = resultant;
      });
    }
  }

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
                itemCount: userList.length,
                itemBuilder: (BuildContext context, int index) =>
                    item(userList[index])),
          )),
    );
  }

  Widget item(userList) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [
        IconSlideAction(
          foregroundColor: Colors.white,
          caption: 'Archive',
          color: Colors.amber,
          icon: Icons.archive,
          onTap: () => print(
            'Archive',
          ),
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              // FactoryData.users.removeWhere((element) => element.id == user.id);
            });
          },
        )
      ],
      child: ListTile(
        textColor: Colors.white,
        leading: CachedNetworkImage(
          imageUrl: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
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
        title: Text(userList['email']),
        subtitle: Text(userList['type']),
        onTap: () {},
      ),
    );
  }
}
