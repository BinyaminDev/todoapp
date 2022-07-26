// import 'package:firstflutter/main.dart';
// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageSate extends StatefulWidget {
  const HomePageSate({Key? key}) : super(key: key);

  @override
  State<HomePageSate> createState() => _HomePageSates();
}

class _HomePageSates extends State<HomePageSate> {
  List<String> mywork = [];
  List<bool>? statusOfWork;
  TextEditingController textEditingController = TextEditingController();
   late FocusNode myfocusNode;
  late SharedPreferences prefs;

  @override
  initState() {
    statusOfWork = List<bool>.filled(mywork.length, false, growable: true);
myfocusNode=FocusNode();
    super.initState();
    retriveData();
    retrieveBoolData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           // deleteValue();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text('TODO APP'),
        backgroundColor: Color.fromARGB(255, 12, 10, 8),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
              child: Text(
                'Work',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                isCheckedFunction(statusOfWork!),
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 1,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Colors.black,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: ListView.builder(
              itemCount: mywork.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  activeColor: Colors.black,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(mywork[index],
                      style: TextStyle(
                        decoration: statusOfWork![index]
                            ? TextDecoration.lineThrough
                            : null,
                      )),
                  value: statusOfWork![index],
                  onChanged: (value) {
                    setState(() {
                      statusOfWork![index] = value!;
                      saveBoolData();
                      
                    });
                        
                    // ignore: unused_element
                  },
                  secondary: IconButton(onPressed: (){
                    setState(() {
                       mywork.removeAt(index);
                       statusOfWork!.removeAt(index);

                    });
                    saveBoolData();
                    saveList();
                  
                
                  }, icon:Icon(Icons.delete_rounded)
                  
           
                  ),
                  
                  
                );
              }),
        ),
      ]),

      /*Row(
                children: const [
                  MoiCheckedBox(),
                  Text(
                    'Breakfast',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 12, 12),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  MoiCheckedBox(),
                  Text(
                    'Meet With HR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  MoiCheckedBox(),
                  Text(
                    'Lunch',
                    style: TextStyle(
                    
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  MoiCheckedBox(),
                  Text(
                    'Football match at 7 pm',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),*/

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(88),
          side: const BorderSide(
            width: 1.4,
            color: Colors.black,
          ),
        ),
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              myfocusNode.requestFocus;
              showMyDialog(context);
            }),
      ),
    );
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: TextFormField(
                  focusNode: myfocusNode,
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ENTER YOUR WORK HERE')),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 105),
                  child: Row(
                    children: [
                      TextButton(
                        child: const Text('cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                                if (textEditingController.text != null &&
                                      textEditingController.text != "") {
                          setState(() {
                            statusOfWork!.insert(mywork.length, false);
                            mywork.add(textEditingController.text);
                            saveList();
                        
                          });
                              saveBoolData();
                         // Navigator.of(context).pop();
                             
                         textEditingController.clear();
                          Navigator.pop(context);
                        }},
                        child: Text(
                          'submit',
                          style: TextStyle(backgroundColor: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                )
              ]);
        });
  }

  retriveData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('Todolist') != null) {
      if(statusOfWork!=null){
        statusOfWork!.clear();
      }
      statusOfWork = List.filled(mywork.length, false, growable: true);
      mywork.addAll(prefs.getStringList('Todolist')!);


     //statusOfWork= List.filled(mywork.length, false, growable: true);
    }

    setState(() {});
  }


  saveList() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList('Todolist', mywork);
    statusOfWork = List.filled(mywork.length, false, growable: true);
  }

  saveBoolData() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? listOFStatus = [];
    for (int i = 0; i < statusOfWork!.length; i++) {
      if (statusOfWork![i]) {
        // print("gjf");
        // prefs.setStringList(key, value);
        listOFStatus.add("true");
      } else {
        // print("kshf");
        listOFStatus.add("false");
      }

    }
    // print(listOFStatus);

    if (prefs.getStringList("checkBoxList") != null) {
      prefs.remove("checkBoxList");
    }
    prefs.setStringList('checkBoxList', listOFStatus);
    // ischecked = List.filled(myWork.length, false, growable: true);
  }
 retrieveBoolData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('checkBoxList') != null) {
      if (statusOfWork != null) {
        statusOfWork!.clear();
      }
      var statusOfWorkBool = prefs.getStringList("checkBoxList");

      // List<String>? listOFStatus;
      // listOFStatus!.addAll(prefs.getStringList("checkBoxList"));
      // print("shvh");
      prefs.getStringList("checkBoxList")!.forEach((element) {
        if (element == "true") {
          // ischecked[element.indexOf(pattern)]

          statusOfWork!.add(true);
        } else {
          statusOfWork!.add(false);
        }
      });
      // statusOfWork = List.filled(myWork.length, false, growable: true);
      // ischecked = List.filled(myWork.length, false, growable: true);
    }
    print(statusOfWork);
    setState(() {});
  }

  // deleteValue() async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.remove('Todolist');
  // }

  isCheckedFunction(List statusOfWork) {
    int count = 0;
    for (int i = 0; i < statusOfWork.length; i++) {
      if (statusOfWork[i] == false) {
        count++;
      }

      //statusOfWork= List.filled(mywork.length, false, growable: true);

    }
    return count.toString();
  }
}
