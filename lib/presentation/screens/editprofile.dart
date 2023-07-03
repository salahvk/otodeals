import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/profileweb.dart';
import 'package:otodeals/data/repositories/update_userDetails.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final ImagePicker _picker = ImagePicker();
  selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    upload(image);
  }

  upload(XFile imageFile) async {
    var stream = http.ByteStream(DelegatingStream(imageFile.openRead()));
    var length = await imageFile.length();
    final apiToken = Hive.box("token").get('api_token');

    var uri = Uri.parse(ApiEndpoint.profileImageUpdate);
    var request = http.MultipartRequest(
      "POST",
      uri,
    );
    // "content-type": "multipart/form-data"
    request.headers.addAll({"device-id": "abc", "api-token": apiToken});
    var multipartFile = http.MultipartFile(
      'profile_image',
      stream,
      length,
      filename: (imageFile.path),
    );
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    await postprofileData(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final profileres = Provider.of<DataProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colormanager.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colormanager.primary,
                            size: 20,
                          )),
                      SizedBox(
                        width: 22,
                      ),
                      Text(
                        "Edit Profile",
                        style: getRegularStyle(
                          color: Colormanager.black,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colormanager.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20.0, top: 2),
                                  child: Stack(children: [
                                    Container(
                                      height: 69,
                                      width: 85,
                                      decoration: BoxDecoration(
                                          color: Colormanager.white,
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  "$endpoint${profileres.profiles?.userDetails?.profileimage}"),
                                              fit: BoxFit.cover)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print("object");
                                        selectImage();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 55, left: 30),
                                        child: Center(
                                          child: Container(
                                              height: 27,
                                              width: 27,
                                              decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Colormanager.white,
                                                        spreadRadius: 0,
                                                        offset: Offset(0, 3))
                                                  ],
                                                  color: Colormanager.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 1),
                                                  child: Image.asset(
                                                    'assets/Instagram-Camera-Icon-oi3r3s.png',
                                                    color: Colormanager.primary,
                                                    height: 20,
                                                  ))),
                                        ),
                                      ),
                                    )
                                  ]),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profileres.profiles?.userDetails?.name ??
                                        '',
                                    style: getRegularStyle(
                                        fontSize: 20,
                                        color: Colormanager.white),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    profileres.profiles?.userDetails?.email ??
                                        '',
                                    style: getMediumtStyle(
                                        color: Colormanager.white,
                                        fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 280,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  color: Colormanager.background.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        color: Colormanager.greyText.withOpacity(0.9))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: EditProfilecontoller.nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
                        hintText: 'Name',
                        hintStyle: getSemiBoldStyle(
                          color: Color.fromARGB(255, 112, 112, 114),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: EditProfilecontoller.emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
                        hintText: 'Email Id',
                        hintStyle: getSemiBoldStyle(
                          color: Color.fromARGB(255, 112, 112, 114),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: EditProfilecontoller.phoneNoController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color.fromARGB(255, 92, 91, 91),
                        ),
                        hintText: 'Phone number',
                        hintStyle: getSemiBoldStyle(
                          color: Color.fromARGB(255, 112, 112, 114),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: EditProfilecontoller.locationController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_pin,
                          color: Color.fromARGB(255, 112, 112, 114),
                        ),
                        hintText: 'Location',
                        hintStyle: getSemiBoldStyle(
                          color: Color.fromARGB(255, 112, 112, 114),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colormanager.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "Update",
                  style:
                      getSemiBoldStyle(color: Colormanager.white, fontSize: 15),
                )),
              ),
              onTap: () {
                updateProfileDetails(context);
              },
            ),
          ],
        ),
      )),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
