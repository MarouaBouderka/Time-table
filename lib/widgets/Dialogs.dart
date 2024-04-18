import 'package:flutter/material.dart';
import '../database/helper_fct.dart';
import '/Distributions/Groups.dart';
import '/widgets/TextFormField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/src/painting/box_border.dart';

Future<void> groupsAddRowDialog(BuildContext context, int year, int section) async {
  
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController id_controller = TextEditingController();
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
                      TextFormFieldWidget(labelText: 'Identifier', color: const Color.fromARGB(255, 189, 162, 236), controller: id_controller,),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(labelText: 'Group Number', color: const Color.fromARGB(255, 189, 162, 236), controller: num_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Student Number', color: const Color.fromARGB(255, 189, 162, 236), controller: stu_controller,),
                      const SizedBox(height: 20),
                      Center( // Center the Add button
                        child: ElevatedButton(
                          onPressed: () async {
                            String id = id_controller.text;
                            int number = int.tryParse(num_controller.text) ?? 0;
                            int stu = int.tryParse(stu_controller.text) ?? 0;
                            Map<String, dynamic> groupData = {
                              'group_id': id,
                              'group_year': year,
                              'group_section': section, 
                              'group_number': number,
                              'student_number': stu,
                            };
                            try{await GroupsData.insertGroup(groupData);}
                            catch(e){ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Id already exists'),
                              ),
                            );}
                            Navigator.of(context).pop();
                          
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
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController semesterController = TextEditingController();

  List<String> categories = ['Fundamental', 'Methodologic', 'Discovery', 'Transversal' ]; // Define your categories list

  String? selectedValue = categories.first;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'New Subject',
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
                        labelText: 'Code',
                        color: const Color.fromARGB(255, 170, 240, 251),
                        controller: idController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        labelText: 'Title',
                        color: const Color.fromARGB(255, 170, 240, 251),
                        controller: titleController,
                      ),
                      const SizedBox(height: 20),
                      
                      
                      DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // Add more decoration..
                        ),
                        hint: const Text(
                          'Category',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        items: categories
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a category.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          selectedValue = value.toString();
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),


                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        labelText: 'Year',
                        color: const Color.fromARGB(255, 170, 240, 251),
                        controller: yearController,
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        labelText: 'Semester',
                        color: const Color.fromARGB(255, 170, 240, 251),
                        controller: semesterController,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (idController.text.isEmpty ||
                                titleController.text.isEmpty ||
                                selectedValue == null ||
                                yearController.text.isEmpty ||
                                semesterController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill all the fields.'),
                                ),
                              );
                              return;
                            }
                            // Retrieve values from text controllers
                            String id = idController.text;
                            String title = titleController.text;
                            String? category = selectedValue;
                            int year = int.tryParse(yearController.text) ?? 0;
                            int semester = int.tryParse(semesterController.text) ?? 0;

                            // Create a map representing the subject data
                            Map<String, dynamic> subjectData = {
                              'subject_id': id,
                              'subject_title': title,
                              'field': field, 
                              'subject_category': category,
                              'year': year,
                              'semester': semester,
                            };
                            try{await SubjectsData.insertSubject(subjectData);}
                            catch(e){ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Id already exists'),
                              ),
                            );}
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 78, 194, 212),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}






Future<void> roomsAddRowDialog(BuildContext context, String type) async {
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
                width: double.infinity, 
                padding: const EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFieldWidget(labelText: 'Identifier', color: const Color.fromARGB(255, 253, 193, 104), controller: id_controller,),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(labelText: 'Capacity', color: const Color.fromARGB(255, 253, 193, 104), controller: capacity_controller,),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (id_controller.text.isEmpty ||
                              capacity_controller.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill all the fields.'),
                                ),
                              );
                              return;
                            }
                            // Retrieve values from text controllers
                            String id = id_controller.text;
                            int capacity = int.tryParse(capacity_controller.text)??0;
                            String session='';
                            if(type=='Amphi')session='lecture';
                            else if(type=='Tuto')session='tuto';
                            else if(type=='Lab')session='lab';
                            // Create a map representing the room data
                            Map<String, dynamic> roomData = {
                              'room_id': id,
                              'room_type':type,
                              'session_type':session,
                              'room_capacity': capacity
                            };
                            try{await RoomsData.insertRoom(roomData);}
                            catch(e){ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Id already exists'),
                              ),
                            );}
                            Navigator.of(context).pop();
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
    TextEditingController id_controller = TextEditingController();
    TextEditingController name_controller = TextEditingController();

    List<String> fields = ['Computer Science', 'Mathematics', 'Statistics', 'Business & Entrepreneurship', 'English', 'Organizational Psychology']; // Define your categories list
    String? selectedfield = fields.first;

    List<String> grades = ['Professor', 'Assistant Professor', 'Associate Professor']; 
    String? selectedgrade = fields.first;

    final List<String> days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday'
    ];
    List<String> selectedDays = [];

    return showDialog(
      context: context,
      builder: (BuildContext context) {
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
                          
                          DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            hint: const Text(
                              'Grade',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            items: grades
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a grade.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              selectedgrade = value.toString();
                            },
                            onSaved: (value) {
                              selectedgrade = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),

                          const SizedBox(height: 20),


                          DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            hint: const Text(
                              'Field',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            items: fields
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a field.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              selectedfield = value.toString();
                            },
                            onSaved: (value) {
                              selectedfield = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Text(
                                  'Select Days',
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                                items: days.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    enabled: false,
                                    child: StatefulBuilder(
                                      builder: (context, menuSetState) {
                                        final isSelected = selectedDays.contains(item);
                                        return InkWell(
                                          onTap: () {
                                            isSelected ? selectedDays.remove(item) : selectedDays.add(item);
                                            menuSetState(() {});
                                          },
                                          child: Container(
                                            height: double.infinity,
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                if (isSelected)
                                                  const Icon(Icons.check_box_outlined, color: Colors.white,)
                                                else
                                                  const Icon(Icons.check_box_outline_blank, color: Colors.white,),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }).toList(),
                                value: selectedDays.isEmpty ? null : selectedDays.last,
                                onChanged: (value) {},
                                selectedItemBuilder: (context) {
                                  return days.map(
                                    (item) {
                                      return Container(
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                          selectedDays.join(', '),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          maxLines: 1,
                                        ),
                                      );
                                    },
                                  ).toList();
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.only(left: 16, right: 8),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (id_controller.text.isEmpty ||
                                  name_controller.text.isEmpty ||
                                  selectedfield == null ||
                                  selectedgrade == null ||
                                  selectedDays.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please fill all the fields.'),
                                      ),
                                    );
                                    return;
                                  }
                                // Retrieve values from text controllers
                                String id = id_controller.text;
                                String name = name_controller.text;
                                String? field = selectedfield;
                                String? grade = selectedgrade;

                                // Create a map representing the subject data
                                Map<String, dynamic> teacherData = {
                                  'teacher_id': id,
                                  'teacher_name': name,
                                  'teacher_grade': grade,
                                  'field': field, 
                                };
                                try{
                                  await TeachersData.insertTeacher(teacherData);
                                  for(int i=0; i<selectedDays.length;i++){
                                    Map<String, dynamic> daysData = {
                                      'teacher_id':id,
                                      'week_day':selectedDays[i]
                                    };
                                    await WorkingDaysData.insertWorkingDay(daysData);
                                  }
                                }
                                catch(e){ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Id already exists'),
                                  ),
                                );}                                
                                Navigator.of(context).pop();
                              },
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


  Future<void> sectionDialog(BuildContext context, String year) async {

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
                          const Text(
                            'Sections',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          for (int i = 0; i < 3; i++)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Groups(section: (i+1).toString() ,year: year,)),
                                );
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
