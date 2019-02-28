import 'package:flutter/material.dart';
import 'package:kingsly_app/models/items.dart';

class DetailedItemPage extends StatelessWidget {

  final ShopItem shopItem;
  final double globalElevation = 5.0;

  DetailedItemPage({@required this.shopItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${shopItem.name}'),
      ),
      body: Stack(
        children: <Widget>[

          Container(
            height: (MediaQuery.of(context).size.height / 3.0) + 140.0,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(shopItem.imageURL),
                fit: BoxFit.cover
              ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)
                )
            ),
          ),

          Container(
            height: (MediaQuery.of(context).size.height / 3.0) + 140.0,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0)
              )
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60.0,),
                  _buildTitle(context),
                  SizedBox(height: 30.0,),
                  _buildHImageScroll(context),
                  SizedBox(height: 30.0,),
                  _buildDescriptionTile(context),
                  SizedBox(height: 30.0,),
                  _buildColorChoice(context),
                  SizedBox(height: 30.0,),
                  _buildSizeChoice(context),
                ],
              ),
            ),
          ),
          
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTitle(BuildContext context){
    return Container(
      height: 80.0,
      child: Card(
        elevation: globalElevation,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(child: Text(shopItem.name),width: double.infinity,),
              Container(child: Text('Some random text'),width: double.infinity,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),),
                      Text('${shopItem.rating}')
                    ],
                  ),
                  Text('${shopItem.price} TL')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHImageScroll(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 160.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Container(
            width: 200.0,
            child: Card(
              elevation: globalElevation,
              child: Image(
                image: NetworkImage(shopItem.imageURL),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }

  Widget _buildDescriptionTile(BuildContext context){
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 60.0,
      width: double.infinity,
      child: Card(
        elevation: globalElevation,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  'Description',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'lorem ipsum something something',
                  style: TextStyle(),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorChoice(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Text('Color',style: TextStyle(fontWeight: FontWeight.w800),),
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: ChoiceChip(
                    label: Text('Color'),
                    selected: false,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizeChoice(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: 70.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text('Size',style: TextStyle(fontWeight: FontWeight.w800),),
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: ChoiceChip(
                    label: Text('Size'),
                    selected: false,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context){
    Size _screenSize = MediaQuery.of(context).size;
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      elevation: 0.0,
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: (_screenSize.width - 20 ) / 2,
              child: Text(
                'ADD TO FAVORITES',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
            Container(
              width: (_screenSize.width - 20 ) / 2,
              child: Text(
                'ORDER NOW',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
      ),
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
}
