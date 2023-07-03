import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';


class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int up=5000;
  

  void increment(){

    setState(() {
      if(up>=5000&&up<50000) {
        up++;
      }
    });
  }
  void decrement(){

    setState(() {
      if(up>5000) {
        up--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Row(children: [
     Container(height:30,
      width:40,
      child: ElevatedButton(onPressed: (){decrement();}, child: Text("-"))),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(width:150,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colormanager.black

            
          ),
          borderRadius: BorderRadius.circular(10)

        ),
        child: Center(child: Text('$up',style: getBoldStyle(color: Colormanager.black,fontSize:14),)),),
      ),
          Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Container(
          height: 30,
          width: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ElevatedButton(onPressed: (){increment();}, child:Center(child: Icon(Icons.add,color: Colormanager.black,)),style:
            ElevatedButton.styleFrom(
              primary: Colormanager.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),),
          ),
        ),
      ),
    ],);
  }
}