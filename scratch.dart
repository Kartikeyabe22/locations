import 'dart:io';


void main()
{ print('hello');
 performTask();

}

void performTask()async {

  String p;
   p= await task2();

  print(p);

}

 Future <String> task2()
async{  String res='';
  Duration threeSeconds =Duration(seconds:3);
 // sleep(threeSeconds);
 await Future.delayed(threeSeconds, (){
      res='yello';
      print(res);


  });

return res;


}

void task3(String task2Data)
{
  String result= 'task 3 data';
  print('Task 3 complete with ${task2Data}');
}

