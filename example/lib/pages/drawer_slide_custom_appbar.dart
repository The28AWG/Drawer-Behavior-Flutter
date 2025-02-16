import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:drawerbehavior_example/menus/main.dart';
import 'package:flutter/material.dart';

class DrawerSlideCustomAppBar extends StatefulWidget {
  @override
  _DrawerSlideCustomAppBarState createState() =>
      _DrawerSlideCustomAppBarState();
}

class _DrawerSlideCustomAppBarState extends State<DrawerSlideCustomAppBar> {
  late int selectedMenuItemId;

  @override
  void initState() {
    selectedMenuItemId = menuWithIcon.items[0].id;
    super.initState();
  }

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: <Widget>[
              new Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/user1.jpg")))),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "John Witch",
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "test123@gmail.com",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            ?.copyWith(color: Colors.white.withAlpha(200)),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }

  DrawerScaffoldController controller = DrawerScaffoldController();
  bool ignoring = false;

  buildDrawer(BuildContext context) {
    return DrawerScaffold(
      controller: controller,
      onOpened: (_) {
        print('onOpened');
        setState(() => ignoring = true);
      },
      onClosed: (_) {
        setState(() => ignoring = false);
      },
      drawers: [
        SideDrawer(
          percentage: 0.8,
          menu: menuWithIcon,
          headerView: headerView(context),
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ],
      builder: (context, id) => IgnorePointer(
        ignoring: ignoring,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Drawer - Slide with Custom AppBar"),
            leading: new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {
                  controller.toggle();
                }),
          ),
          body: IndexedStack(
            index: id,
            children: menuWithIcon.items
                .map(
                  (e) => ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text("Page~${e.label} $index"),
                      onTap: () {},
                    ),
                    itemCount: 500,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }
}
