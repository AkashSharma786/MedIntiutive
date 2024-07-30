import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/drop_down_button.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementState();
}

class _ManagementState extends State<ManagementPage> with SingleTickerProviderStateMixin {

   late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print("Selected Tab Index: ${_tabController.index}");
      }
      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    List<String> list = ["Medicine", "Stock", "Orders", "Supplier", "Expense"];
    Size screenSize = MediaQuery.of(context).size;
    
    return  DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: const Text('Store Management')),

            bottom:  PreferredSize(
              preferredSize: Size( screenSize.width, 100),
              child:  Column(
                children: [

                TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                      color: Colors.cyan,
                    ),
                    
                    
                    tabs: [
                      Tab(child:
                       Text("Medicine")),
                      Tab(child:  Text("Medicine"),),
                      Tab(child:  Text("Stock"),),
                      Tab(child:  Text("Orders"),),
                      Tab(child:  Text("Supplier"),),
                      Tab(child:  Text("Expense"),),
                    
                    ],
                  ),
              
                
                   
                
                  Text(_tabController.index.toString()),
                ],
              ),
            ),
            
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Text("kfjkf"),
              Text("dkfjfkfjdfjfkdfjsdf"),
              Text("kfjfkkfjfkfjfkjfklfjfklfsklfjfkfj"),
            ],
          ),
        ),
      );
    
  }
}
