import 'package:flutter/material.dart';
import 'widgets/nav-drawer.dart';
import 'Global.dart' as Global;

class Cavalos extends StatefulWidget{


Cavalos({super.key});

  @override
  State<Cavalos> createState() => _CavalosState();
}

class _CavalosState extends State<Cavalos> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Cavalos'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              Global.data[index].isExpanded = !isExpanded;
            });
          },
          children: Global.data.map((Global.Item item){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(title: Text(item.headerValue));
              },
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(height: 200, width: 150, decoration: BoxDecoration(image: DecorationImage(image:AssetImage(item.imagePath))))
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(item.expandedValue),
                    )
                  ],
                ),
                
              ),
              isExpanded: item.isExpanded
            );
          }).toList(),
        ))
        );
  }
}
