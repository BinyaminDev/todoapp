
/*import 'package:firstflutter/checkedbox.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            
          
          appBar: AppBar(
          leading: const IconButton(onPressed: null, icon:  Icon(Icons.arrow_back_ios,color: Colors.white,),),
            
            title: const Text('TODO APP'),
            backgroundColor: Color.fromARGB(255, 12, 10, 8),),
          
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '  Work',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    '3  ',
                    style: TextStyle(fontSize: 19),
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
            
            ],
          ),
           floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(88),
              side: BorderSide(
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
              onPressed: () { showMyDialog(context);}
              
              ),
         
      ),
      
        
      );
      
    
    
  } 
   void showMyDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          content: TextFormField(
            decoration:const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ENTER YOUR WORK HERE'
            )
          ),
          actions: <Widget>[Padding(
            padding: const EdgeInsets.only(left: 85),
            child: Row(children: [
              FlatButton(
                child:const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('submit',style: TextStyle(backgroundColor: Colors.blue),),),
            ],),
          )
           ]);
      },
    );
}}*/