import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import '/Distributions/Groups.dart';
import '/database/add_data.dart';
import '/widgets/TextFormField.dart';
import 'package:flutter/material.dart';

Future<void> groupsAddRowDialog(BuildContext context) async {
  List<TextEditingController> controllers = List.generate(
    5, 
    (index) => TextEditingController(),
  );
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController id_controller = TextEditingController();
      TextEditingController year_controller = TextEditingController();
      TextEditingController sec_controller = TextEditingController();
      TextEditingController num_controller = TextEditingController();
      TextEditingController stu_controller = TextEditingController();

      return AlertDialog(
        title: const Text('New Group', style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, // Use the full width of the screen
                padding: const EdgeInsets.all(20), // Add padding around the container
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20), // Add space between title and form fields
                      TextFormFieldWidget(labelText: 'Identifier', color: Color.fromARGB(255, 189, 162, 236), controller: id_controller,),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(labelText: 'Year', color: Color.fromARGB(255, 189, 162, 236), controller: year_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Section', color: Color.fromARGB(255, 189, 162, 236), controller: sec_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Group Number', color: Color.fromARGB(255, 189, 162, 236), controller: num_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Student Number', color: Color.fromARGB(255, 189, 162, 236), controller: stu_controller,),
                      const SizedBox(height: 20),
                      Center( // Center the Add button
                        child: ElevatedButton(
                          onPressed: () {
                            addRowToExcel(id_controller.text, year_controller.text, sec_controller.text, num_controller.text, stu_controller.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: const Text('Add', style:TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      );
    },
  );
}





Future<void> subjectsAddRowDialog(BuildContext context, String field) async {
  List<TextEditingController> controllers = List.generate(
    5, 
    (index) => TextEditingController(),
  );
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController id_controller = TextEditingController();
      TextEditingController title_controller = TextEditingController();
      TextEditingController category_controller = TextEditingController();
      TextEditingController year_controller = TextEditingController();
      TextEditingController semester_controller = TextEditingController();

      return AlertDialog(
        title: const Text('New Subject', style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, // Use the full width of the screen
                padding: const EdgeInsets.all(20), // Add padding around the container
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20), // Add space between title and form fields
                      TextFormFieldWidget(labelText: 'Code', color: Color.fromARGB(255, 170, 240, 251), controller: id_controller,),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(labelText: 'Title', color: Color.fromARGB(255, 170, 240, 251), controller: title_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Category', color: Color.fromARGB(255, 170, 240, 251), controller: category_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Year', color: Color.fromARGB(255, 170, 240, 251), controller: year_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Semester', color: Color.fromARGB(255, 170, 240, 251), controller: semester_controller,),
                      const SizedBox(height: 20),
                      Center( // Center the Add button
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 78, 194, 212),
                          ),
                          child: const Text('Add', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      );
    },
  );
}




Future<void> roomsAddRowDialog(BuildContext context, String type) async {
  List<TextEditingController> controllers = List.generate(
    5, 
    (index) => TextEditingController(),
  );
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController id_controller = TextEditingController();
      TextEditingController capacity_controller = TextEditingController();

      return AlertDialog(
        title: const Text('New Room', style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, // Use the full width of the screen
                padding: const EdgeInsets.all(20), // Add padding around the container
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldWidget(labelText: 'Identifier', color: Color.fromARGB(255, 253, 193, 104), controller: id_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Capacity', color: Color.fromARGB(255, 253, 193, 104), controller: capacity_controller,),
                      const SizedBox(height: 20),
                      Center( // Center the Add button
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Add', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      );
    },
  );
}




Future<void> teacherAddRowDialog(BuildContext context) async {
    List<TextEditingController> controllers = List.generate(
      5,
      (index) => TextEditingController(),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController id_controller = TextEditingController();
        TextEditingController name_controller = TextEditingController();
        TextEditingController grade_controller = TextEditingController();
        TextEditingController field_controller = TextEditingController();
        TextEditingController working_days_controller = TextEditingController();

        return AlertDialog(
            title: const Text(
              'New Teacher',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            labelText: 'Identifier',
                            color: const Color.fromARGB(255, 255, 242, 126),
                            controller: id_controller,
                          ),
                          const SizedBox(height: 10),
                          TextFormFieldWidget(
                            labelText: 'Teacher Name',
                            color: const Color.fromARGB(255, 255, 242, 126),
                            controller: name_controller,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            labelText: 'Teacher Grade',
                            color: const Color.fromARGB(255, 255, 242, 126),
                            controller: grade_controller,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            labelText: 'Field',
                            color: const Color.fromARGB(255, 255, 242, 126),
                            controller: field_controller,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            labelText: 'Working Days',
                            color: const Color.fromARGB(255, 255, 242, 126),
                            controller: working_days_controller,
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                              ),
                              child: const Text('Add',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          );
      },
    );
  }


  Future<void> sectionDialog(BuildContext context, String year, int nb_of_sections) async {
    List<TextEditingController> controllers = List.generate(
      5,
      (index) => TextEditingController(),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text(
              'Sections',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sections',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          for (int i = 0; i < nb_of_sections; i++)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Groups(section: (i+1).toString() ,year: year,)), // Replace with GroupsPage constructor if needed
                                );
                                print('${i+1} ${year}');
                              },
                              child: Card(
                                child: Container(
                                  height: 40,
                                  width: 200,
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Section ${i+1}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                    )
                  )
                ]
              )
            )
          );
      },
    );
  }
