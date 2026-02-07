import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:first_task/view_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'files.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
          child: Column(
            children: [
              Text('Upload File', style: TextStyle(color: Color(0xFF404040), fontSize: 40, fontWeight: FontWeight.bold),),
              Text('Upload your store details to view them here', style: TextStyle(color: Color(0xFF404040), fontSize: 18,),),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0x22673AB7),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFF673AB7),
                    width: 3,
                  )
                ),
                child: Column(
                  children: [
                    Icon(Icons.file_upload_outlined, color: Color(0xFF673AB7), size: 100,),
                    SizedBox(height: 10,),
                    TextButton(
                      onPressed: () async {
                        try {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['xlsx', 'xls'],
                          );
                          if (result != null && !kIsWeb) {
                            File file = File(result.files.single.path!);
                            Map<String, List> fileContent = await Files.readExcelFile(file);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewPage(pro_details: fileContent),
                              ),
                            );
                          } else if (result == null) {
                            print('user canceled the picker');
                          }
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                      child: const Text(
                        'click here to upload',
                        style: TextStyle(color: Color(0xFF673AB7), fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
