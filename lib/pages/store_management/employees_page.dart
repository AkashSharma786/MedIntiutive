import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_add.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_delete.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_edit.dart';

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


  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  void addEmployees(){
    List<String> fieldList = DatabaseService.employeesField;

      print(idController.text);
      print(firstNameController.text);
      print(lastNameController.text);

      print(phoneNumberController.text);
      print(emailController.text);
      print(addressController.text);
      print(dobDayController.text);
      print(dobMonthController.text);
      print(dobYearController.text);
      print(genderController.text);
      print(photoLocationController.text);
      print(experienceController.text);
      print(weatherAdminController.text);

   
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context){
     switch(currentClickedButton){
       case 1:
         return Row(
           children: [
             EmployeesAdd(
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
             ),
             
           ],
         );
       case 2:
         return Column(
           children: [
             EmployeesEdit(),
             Container(
               width: screenSize.width,
               
               color: Colors.red,
             )
           ],
         );
       case 3:
         return Column(
           children: [
             EmployeesDelete(),
             Container(
               width: screenSize.width,
               
               color: Colors.red,
             )
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
                  width: screenSize.width,
                  color: Colors.purple,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Text(tableData[index].toString());
                    },
                  ),
                );
              });
       }
    });
  }
}
