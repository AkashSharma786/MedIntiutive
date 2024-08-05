import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/tile.dart';
import 'package:flutter_application_1/material_styles/update_dialog.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_add.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_search.dart';

class EmployeesPage extends StatefulWidget {
  EmployeesPage({super.key});
  @override
  State<EmployeesPage> createState() => EmployeesPageState();
}

class EmployeesPageState extends State<EmployeesPage> {

  TextEditingController idController  = TextEditingController() ;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController photoLocationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aadhaarController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController weatherAdminController = TextEditingController();
  TextEditingController dobDayController = TextEditingController();
  TextEditingController dobMonthController = TextEditingController();
  TextEditingController dobYearController = TextEditingController();
 List<String> fieldList = DatabaseService.employeesField;
  Future<List<Map<String, Object?>>> items = DatabaseService.showItems('employees');
  



  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });

    if(num == 1){
      showEmployeesAddingDialog();
    }
  }






  
void updateDialog( Map<String, Object?> data ){

  showDialog(context: context, builder: (context){

    return AlertDialog(
      title: Text("Update Employee"),
      content: UpdateDialog( data: data, refresh: searchEmployee,)
    );
  });


}


  void addEmployees(){
   
    DatabaseService.addItems("employees", {
      fieldList[0] : int.tryParse(idController.text),
      fieldList[1] : firstNameController.text,
      fieldList[2] : lastNameController.text,
      fieldList[3] : int.tryParse(phoneNumberController.text),
      fieldList[4] : emailController.text,
      fieldList[5] : addressController.text,
      fieldList[6] : int.tryParse('${dobDayController.text}${dobMonthController.text}${dobYearController.text}'),
      fieldList[7] : genderController.text,
      fieldList[8] : photoLocationController.text,
      fieldList[9] : aadhaarController.text,
      fieldList[10] : experienceController.text,
      fieldList[11] : weatherAdminController.text,
      
      
      


    });
    
  }

  void searchEmployee(){

    setState(() {
       items = DatabaseService.searchItem("employees",
     fieldList[0], int.tryParse(idController.text),
     fieldList[1], firstNameController.text,
     fieldList[2], lastNameController.text);
      
    });

   

  }

  void showEmployeesAddingDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Add Employee"),
        content: EmployeesAdd(
          idController: idController,
          firstNameController:firstNameController ,
          lastNameController: lastNameController,
          addressController:addressController ,
          phoneNumberController: phoneNumberController,
          photoLocationController: photoLocationController,
          emailController: emailController,
          aadhaarController: aadhaarController,
          experienceController: experienceController,
          weatherAdminController: weatherAdminController,
          genderController: genderController,
          dobDayController: dobDayController,
          dobMonthController: dobMonthController,
          dobYearController: dobYearController,
          addEmployee: addEmployees,
          refresh: searchEmployee,

        ),
      );
    });
  }



  void deleteEmployee(Map<String, Object?> tableData){
    DatabaseService.deleteItem('employees',int.parse('${tableData[fieldList[0]]}'));
    searchEmployee();
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context){
     switch(currentClickedButton){
       
       case 2:
         return Column(
           children: [
             EmployeesSearch( id: idController,
             firstName: firstNameController,
             lastName: lastNameController,
             search: searchEmployee,
            
             ),
             FutureBuilder(
              future: items,
              builder: (context, snapshot) {
                late List<Map<String, Object?>> tableData;
                if (snapshot.hasError) {
                  const Center(
                    child: Text("Error Occured"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No medicines found.'));
                } else {
                  tableData = snapshot.data!;
                }

                return Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.8,
      
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index],  editFunction: updateDialog, icon : Icon(Icons.edit),);
                    },
                  ),
                );
              })


          


           ],
         );
       case 3:
         return Column(
           children: [
             EmployeesSearch( id: idController,
             firstName: firstNameController,
             lastName: lastNameController,
             search: searchEmployee,
             ),
             FutureBuilder(
              future: items,
              builder: (context, snapshot) {
                late List<Map<String, Object?>> tableData;
                if (snapshot.hasError) {
                  const Center(
                    child: Text("Error Occured"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No medicines found.'));
                } else {
                  tableData = snapshot.data!;
                }

                return Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.8,
             
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index], deleteFunction: deleteEmployee, icon : Icon(Icons.delete),);
                    },
                  ),
                );
              })

           


           ],
         );
       default: 
       return FutureBuilder(
              future: DatabaseService.showItems("employees"),
              builder: (context, snapshot) {
                late List<Map<String, Object?>> tableData;
                if (snapshot.hasError) {
                  const Center(
                    child: Text("Error Occured"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No medicines found.'));
                } else {
                  tableData = snapshot.data!;
                }

                return Container(
              
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index], );
                    },
                  ),
                );
              });
       }
    });
  }
}
