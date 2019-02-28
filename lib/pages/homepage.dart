import 'package:flutter/material.dart';
import 'package:kingsly_app/models/items.dart';
import 'package:kingsly_app/pages/detailedItemPage.dart';
import 'package:kingsly_app/pages/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pazarcim'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},
          ),
          _actionButtonBadge(context)
        ],
      ),
      drawer: _buildAppDrawer(context),
      floatingActionButton: _buildFloatingActionButton(context),
      body: _buildItemGrid(context),
    );
  }

  Widget _buildAppDrawer(BuildContext context){
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('guestuser@gmail.com'),
            accountName: Text('Guest User'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person,size: 55.0,),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('Order Notification'),
            onTap: (){},
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.history,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('Order Notification'),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('Profile Settings'),
            onTap: (){},
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.home,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('Delivery Address'),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            trailing: CircleAvatar(
              child: Icon(Icons.help,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('Help'),
            onTap: (){},
          ),
          ListTile(
            trailing: CircleAvatar(
              child: Icon(Icons.people_outline,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('About Us'),
            onTap: (){},
          ),
          Divider(),
          ListTile(
            trailing: CircleAvatar(
              child: Icon(Icons.exit_to_app,color: Colors.white,),
              backgroundColor: Theme.of(context).primaryColor,
            )
            ,
            title: Text('Login'),
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _actionButtonBadge(BuildContext context){
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.message),
          onPressed: (){},
        ),
        Positioned(
          top: -2.0,
          left: 1.0,
          child: Container(
            margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.red
            ),
            child: Center(
              child: Text('1',style: TextStyle(color: Colors.white),),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFloatingActionButton(BuildContext context){
    return Stack(
      children: <Widget>[
        FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.shopping_cart,color: Colors.white,),
        ),
        Positioned(
          top: -10.0,
          left: 0.0,
          child: Container(
            margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.red
            ),
            child: Center(
              child: Text('1',style: TextStyle(color: Colors.white),),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItemGrid(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context,index){
        return Container(
          height: height,
          child: _buildItem(
            context: context,
            shopItem: shopItems[index]
          ),
        );
      },
      itemCount: shopItems.length,
    );
  }

  Widget _buildItem({BuildContext context,ShopItem shopItem}){
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) => DetailedItemPage(shopItem: shopItem)));
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: NetworkImage(shopItem.imageURL),
              fit: BoxFit.cover,
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Container(
                  height: 25.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 4.0),
                  color: Colors.black.withAlpha(100),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            shopItem.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            '${shopItem.price} TL',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
