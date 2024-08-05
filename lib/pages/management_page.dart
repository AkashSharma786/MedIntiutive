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
  final GlobalKey<EmployeesPageState> _employeesPageKey =
      GlobalKey<EmployeesPageState>();
  final GlobalKey<ExpensePageState> _expensePageKey =
      GlobalKey<ExpensePageState>();
  final GlobalKey<MedicinePageState> _medicinePageKey =
      GlobalKey<MedicinePageState>();
  final GlobalKey<OrdersPageState> _ordersPageKey =
      GlobalKey<OrdersPageState>();
  final GlobalKey<StockPageState> _stockPageKey = GlobalKey<StockPageState>();
  final GlobalKey<SupplierPageState> _supplierPageKey =
      GlobalKey<SupplierPageState>();

  late TabController _tabController;
  int sectionButtonsClicked = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {}
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onButtonClicked(int whichButtonClicked) {
    switch (_tabController.index) {
      case 0:
        _medicinePageKey.currentState!.updateColumn(whichButtonClicked);

        break;
      case 1:
        _employeesPageKey.currentState!.updateColumn(whichButtonClicked);

        break;
      case 2:
        _supplierPageKey.currentState!.updateColumn(whichButtonClicked);
        break;
      case 3:
        _ordersPageKey.currentState!.updateColumn(whichButtonClicked);
        break;
      case 4:
        _stockPageKey.currentState!.updateColumn(whichButtonClicked);
        break;
      case 5:
        _expensePageKey.currentState!.updateColumn(whichButtonClicked);
        break;
    }
  }

  int getButtonClicked() {
    return sectionButtonsClicked;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
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
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    unselectedLabelColor: Colors.white,

                    indicator: const BoxDecoration(
                      color: Colors.white,
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
                      return MedicineSection(
                        whichButtonClicked: onButtonClicked,
                      );
                    case 1:
                      return EmployeesSection(
                          whichButtonClicked: onButtonClicked);
                    case 2:
                      return SupplierSection(
                          whichButtonClicked: onButtonClicked);
                    case 3:
                      return OrdersSection(whichButtonClicked: onButtonClicked);
                    case 4:
                      return StockSection(whichButtonClicked: onButtonClicked);
                    case 5:
                      return ExpenseSection(
                          whichButtonClicked: onButtonClicked);
                    default:
                      return Text("Medicine");
                  }
                }),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            
              Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.black,

            ),

            TabBarView(controller: _tabController, children: [
              MedicinePage(
                key: _medicinePageKey,
              ),
              EmployeesPage(key: _employeesPageKey),
              SupplierPage(
                key: _supplierPageKey,
              ),
              OrdersPage(
                key: _ordersPageKey,
              ),
              StockPage(key: _stockPageKey),
              ExpensePage(key: _expensePageKey),
            ]),

          
          ],
        ),
        
      ),
    );
  }
}
