
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageSate extends StatefulWidget {
  const HomePageSate({Key? key}) : super(key: key);

  @override
  State<HomePageSate> createState() => _HomePageSates();
}

class _HomePageSates extends State<HomePageSate> {
  List<String> mywork = [];
  //List<bool>? isChecked;
     List<bool>? statusOfWork;
  TextEditingController textEditingController = TextEditingController();
  late SharedPreferences prefs;


  @override
  initState() {
    statusOfWork = List<bool>.filled(mywork.length, false, growable: true);
    
    super.initState();
    retriveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            deleteValue();
          },
          icon:const Icon(
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
          children:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '  Work',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
               Padding(
              padding: EdgeInsets.all(8.0),
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
          indent: 15,
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
                  title: Text (
                  mywork[index],style: TextStyle( 
                    decoration:statusOfWork![index]
                  ?TextDecoration.lineThrough:null,)),
                  
                  value: statusOfWork![index],
                  onChanged: (value) {
                    setState(() {
                      statusOfWork![index] = value!;
                    });
                    // ignore: unused_element
                  },
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
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ENTER YOUR WORK HERE')),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 85),
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
                          setState(() {
                            statusOfWork!.insert(mywork.length, false);
                            mywork.add(textEditingController.text);
                            saveList();
                          });

                          Navigator.of(context).pop();
                        },
                        child: const Text(
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
        mywork.addAll(prefs.getStringList('Todolist')!);
        statusOfWork = List.filled(mywork.length, false, growable: true);
       // statusOfWork= List.filled(mywork.length, false, growable: true);
      }
      
      setState(() {});

    }

    
  saveList() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList('Todolist', mywork);
    statusOfWork = List.filled(mywork.length, false, growable: true);
    
  }

  deleteValue() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('Todolist');

  }
   isCheckedFunction(List statusOfWork){
    int count=0;
  for(int i=0; i<  statusOfWork.length;i++){
    if( statusOfWork[i]==false){
      count++;

    }
    
 //statusOfWork= List.filled(mywork.length, false, growable: true);
    return count.toString();
  }
    
    
  }
  }