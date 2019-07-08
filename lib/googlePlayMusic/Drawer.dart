import 'package:flutter/material.dart';

class DrawerScreen {
  final String path, name;
  final IconData leading;
  DrawerScreen(this.path, this.name, this.leading);
}

final List<DrawerScreen> screens = [
  DrawerScreen('listenNow', 'Listen Now', Icons.play_circle_filled),
  DrawerScreen('recents', 'Recents', Icons.settings_backup_restore),
  DrawerScreen('', 'Top charts', Icons.star),
  DrawerScreen('', 'New releases', Icons.new_releases),
  DrawerScreen('', 'Music library', Icons.library_music),
  DrawerScreen('', 'Shop', Icons.shop)
];

class MyDrawer extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    final String currentPath = ModalRoute.of(context).settings.name;
    final drawerItems = <Widget>[
      UserAccountsDrawerHeader(
          accountEmail: Text("heliojmsemedo@gmail.com"),
          accountName: Text("Hélio"),
          currentAccountPicture: CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage("assets/images/userAvatar.png"),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/accountBanner.jpeg")),
          ))
    ];
    drawerItems.addAll(screens.map((i) => ListTile(
        leading: Icon(i.leading),
        title: Text(i.name),
        selected: currentPath == i.path,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, i.path);
        })));
    drawerItems.addAll(<Widget>[
      Divider(),
      ListTile(
          title: Text("Downloaded only"),
          trailing: Switch(
            value: false,
            onChanged: (val) => {},
          ),
          onTap: () {
            //ignore
          }),
      ListTile(
          title: Text("Settings"),
          onTap: () {
            //ignore
          }),
      ListTile(
          title: Text("Help and feedback"),
          onTap: () {
            //ignore
          })
    ]);
    return ListView(
      padding: EdgeInsets.zero,
      children: drawerItems
    );
  }
}
