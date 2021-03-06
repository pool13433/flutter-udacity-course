import 'package:flutter/material.dart';
import 'package:hello_rectangle/category.dart';
import 'package:hello_rectangle/unit.dart';


final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget{
  const CategoryRoute();

  static const _categroyNames = <String>[
    'Length',
    'Area',
    'Volumn',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency'
  ];
  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red
  ];

  Widget _buildCategoryWidget(List<Widget> categories){
    return ListView.builder(
      itemBuilder: (BuildContext context,int index) => categories[index],
      itemCount: categories.length,
    );
  }

  List<Unit> _retriveUnitList(String categoryName){
    return List.generate(10, (int i){
      i += 1;
      return Unit(
        name : '$categoryName Unit $i',
        conversion : i.toDouble()
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for(var i = 0; i < _categroyNames.length ;i++){
      categories.add(Category(
        name : _categroyNames[i],
        color : _baseColors[i],
        iconLocation:  Icons.cake,
        units : _retriveUnitList(_categroyNames[i])
      ));
    }

    final listView = Container(
      color : _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child : _buildCategoryWidget(categories),
    );
    
    final appBar = AppBar(
      elevation: 0.0,
      title : Text(
        'Unit Converter',
        style : TextStyle(
          color : Colors.black,
          fontSize: 30.0,
        )
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );
    return Scaffold(
      appBar: appBar,
      body : listView,
    );
  }

  
}