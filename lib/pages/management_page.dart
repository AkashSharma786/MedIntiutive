import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/drop_down_button.dart';
import 'package:flutter_application_1/pages/store_management/employees_page.dart';
import 'package:flutter_application_1/pages/store_management/expense_page.dart';
import 'package:flutter_application_1/pages/store_management/medicine_page.dart';
import 'package:flutter_application_1/pages/store_management/orders_page.dart';
import 'package:flutter_application_1/pages/store_management/sections/employees_section.dart';
import 'package:flutter_application_1/pages/store_management/sections/expense_section.dart';
import 'package:flutter_application_1/pages/store_management/sections/medicine_section.dart';
import 'package:flutter_application_1/pages/store_management/sections/orders_section.dart';
import 'package:flutter_application_1/pages/store_management/sections/stock_section.dart';
import 'package:flutter_application_1/pages/store_management/sections/supplier_section.dart';
import 'package:flutter_application_1/pages/store_management/stock_page.dart';
import 'package:flutter_application_1/pages/store_management/supplier_page.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementState();
}

class _ManagementState extends State<ManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        print("Selected Tab Index: ${_tabController.index}");
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size(screenSize.width, 40),
            child: Column(
              children: [
                Container(
                  height: 26,
                  child: const Text(
                    'Store Management',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  child:  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    indicator: const BoxDecoration(
                      color: Colors.cyan,
                    ),
                    tabs: [
                       Tab(child: Text("Medicine")),
                      Tab(
                        child: Text("Employees"),
                      ),
                      Tab(
                        child: Text("Supplier"),
                      ),
                      Tab(
                        child: Text("Orders"),
                      ),
                      Tab(
                        child: Text("Stock"),
                      ),
                      Tab(
                        child: Text("Expense"),
                      ),
                    ],
                  ),
                ),
                Builder(builder: (context) {
                  switch (_tabController.index) {
                    case 0:
                      return MedicineSection();
                    case 1:
                      return EmployeesSection();
                    case 2:
                      return SupplierSection();
                    case 3:
                      return OrdersSection();
                    case 4:
                      return StockSection();
                    case 5:
                      return ExpenseSection();
                    default:
                      return Text("Medicine");
                  }
                }),
              ],
            ),
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          MedicinePage(),
          EmployeesPage(),
          SupplierPage(),
          OrdersPage(),
          StockPage(),
          ExpensePage(),
        ]),
      ),
    );
  }
}
