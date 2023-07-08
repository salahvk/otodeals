import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class UploadPaySlipScreen extends StatefulWidget {
  @override
  _UploadPaySlipScreenState createState() => _UploadPaySlipScreenState();
}

class _UploadPaySlipScreenState extends State<UploadPaySlipScreen> {
  String? filePath;

  Future<void> _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height:size.height/17,
            decoration: BoxDecoration(
      
              border: Border.all(
                color: Colormanager.greyText,
                width: 2.0
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   ElevatedButton(
              onPressed: _openFileExplorer,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colormanager.grey)
              ),
              child: Text('Browse...',style: getMediumtStyle(color:Colormanager.black,fontSize:12),),
                      ),
              SizedBox(width: 8),
                  Expanded(
                    child: Text(
             filePath ?? 'No file selected',style: getMediumtStyle(color:Colormanager.greyText),
                     
                      ),
                    ),
                    ]),
            ),
      )],
            ),
          );
        
  }
}
