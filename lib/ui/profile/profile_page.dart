import 'package:app/app_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../services/hive_db_service.dart';
import '../home/register_page.dart';
import 'components/main_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool passwordObscured = true;

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    profileController.getProfile();
    super.initState();
  }

  bool uz = false;
  bool ru = false;
  bool eng = false;

  bool us = false;
  bool tal = false;
  bool bol = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Get.theme.backgroundColor,
                elevation: 0,
                title: Text(
                  "Profile",
                  style: GoogleFonts.mogra(fontSize: 27),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 4, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                    AssetImage("assets/images/avatar.png"),
                                  )),
                            ),
                            Positioned(
                              bottom: 2,
                              right: 3,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 0,
                                      color: Colors.white,
                                    ),
                                    color: Colors.blue),
                                child: const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "${profileController.user == null
                              ? " "
                              : profileController.user
                              ?.firstName} ${profileController.user == null
                              ? " "
                              : profileController.user?.lastName}",
                          style: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "${profileController.user == null
                              ? " "
                              : profileController.user?.phoneNumber} ",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      MainCard(
                          iconWidgetLast: Icon(
                            Icons.arrow_right,
                            size: 25,
                            color: Get.isDarkMode ? Colors.black : Colors.grey,
                          ),
                          mainText: 'Tahrirlash Profile',
                          onPressed: () {
                            editProfile();
                          },
                          iconWidget: Image.asset(
                            "assets/images/img_6.png",
                            height: 80,
                            width: 23,
                          )),
                      MainCard(
                          iconWidgetLast: Icon(
                            Icons.arrow_right,
                            size: 25,
                            color: Get.isDarkMode ? Colors.black : Colors.grey,
                          ),
                          mainText: 'Language',
                          onPressed: () {
                            changeLanguage();
                          },
                          iconWidget: Image.asset(
                            "assets/images/img_7.png",
                            height: 80,
                            width: 23,
                          )),
                      MainCard(
                          iconWidgetLast: Icon(
                            Icons.arrow_right,
                            size: 25,
                            color: Get.isDarkMode ? Colors.black : Colors.grey,
                          ),
                          mainText: 'Change role',
                          onPressed: () {
                            setState(() {
                              changeRole();
                            });
                          },
                          iconWidget: Image.asset(
                            "assets/images/img_6.png",
                            height: 80,
                            width: 23,
                          )),
                      const SizedBox(
                        width: 22.13,
                      ),
                      MainCard(
                        iconWidgetLast: Icon(
                          Icons.arrow_right,
                          size: 25,
                          color: Get.isDarkMode ? Colors.black : Colors.grey,
                        ),
                        mainText: 'Change password',
                        onPressed: () {
                          changePassword();
                        },
                        iconWidget: Image.asset(
                          "assets/images/img_5.png",
                          height: 50,
                          width: 21,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.grey
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 22.13,
                            ),
                            Image.asset("assets/images/img_4.png",
                                height: 50, width: 23),
                            const SizedBox(
                              width: 14.13,
                            ),
                            TextButton(
                                child: Text('Logout',
                                    style: GoogleFonts.mogra(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20.0)),
                                        title: const Text(
                                          "Chiqish",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 20),
                                        ),
                                        content: const Text(
                                          "Chiqishingizga ishonchingiz komilmi?",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 17),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Yo'q",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              HiveService.deleteAllUsers();
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (
                                                      BuildContext context) => const RegisterPage(),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              "Ha",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 17),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Future editProfile() {
    return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      builder: ((context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade400 : Colors.grey,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,
                            color:
                            Get.isDarkMode ? Colors.black : Colors.black),
                        hintText: profileController.user!.firstName ?? " ",
                        hintStyle: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      controller: profileController.firstNameEditingController,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,
                            color:
                            Get.isDarkMode ? Colors.black : Colors.black),
                        hintText: profileController.user!.lastName ?? " ",
                        hintStyle: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      controller: profileController.lastNameEditingController,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,
                            color:
                            Get.isDarkMode ? Colors.black : Colors.black),
                        hintText: profileController.user!.phoneNumber ?? " ",
                        hintStyle: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      controller:
                      profileController.phoneNumberEditingController,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: profileController.birthEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.date_range_outlined,
                            color:
                            Get.isDarkMode ? Colors.black : Colors.black),
                        // hintText: DateFormat("dd.MM.yy").format(
                        //   DateTime.now(),
                      ),
                      // ),
                      onTap: () async {
                        DateTime?pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2200));
                        if(pickeddate!=null){
                          setState(() {
                            profileController.birthEditingController.text=DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        profileController.getSave(context);
                      },
                      child: Text("Saqlash"),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                )
              ],
            ));
      }),
    );
  }

  Future changeLanguage() {
    return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      builder: ((context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade400 : Colors.grey,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                        Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          'Uzbekcha',
                          style: TextStyle(
                              color:
                              Get.isDarkMode ? Colors.black : Colors.black),
                        ),
                        secondary: Image.asset("assets/images/img_9.png",height: 33,),
                        autofocus: false,
                        activeColor: Colors.orange,
                        checkColor: Colors.white,
                        value: uz,
                        onChanged: (val) {
                          setState(() {
                            uz = val!;
                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title: Text(
                        'Inglizcha',
                        style: TextStyle(
                            color:
                            Get.isDarkMode ? Colors.black : Colors.black),
                      ),
                      secondary: Image.asset("assets/images/img_11.png",height: 33,),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      value: eng,
                      onChanged: (val) {
                        setState(() {
                          eng = val!;
                        });
                      },
                    ), //Che
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title: Text(
                        'Ruscha',
                        style: TextStyle(
                            color:
                            Get.isDarkMode ? Colors.black : Colors.black),
                      ),
                      secondary: Image.asset("assets/images/img_10.png",height: 33,),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      value: ru,
                      onChanged: (val) {
                        setState(() {
                          ru = val!;
                        });
                      },
                    ), //C
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Saqlash"),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                )
              ],
            ));
      }),
    );
  }

  Future changeRole() {
    return showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      builder: ((context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade400 : Colors.grey,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title: Text(
                        'O\'qituvchi',
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                        ),
                      ),
                      secondary: Icon(Icons.person,
                          size: 23,
                          color: Get.isDarkMode ? Colors.black : Colors.black),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      selected: us,
                      value: us,
                      onChanged: (val) {
                        setState(() {
                          us = val!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title: Text(
                        'Talaba',
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                        ),
                      ),
                      secondary: Icon(Icons.person,
                          size: 23,
                          color: Get.isDarkMode ? Colors.black : Colors.black),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      selected: tal,
                      value: tal,
                      onChanged: (val) {
                        setState(() {
                          tal = val!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                      Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title: Text(
                        'O\'quvchi',
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                        ),
                      ),
                      secondary: Icon(Icons.person,
                          size: 23,
                          color: Get.isDarkMode ? Colors.black : Colors.black),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      selected: bol,
                      value: bol,
                      onChanged: (val) {
                        setState(() {
                          bol = val!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Saqlash"),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                )
              ],
            ));
      }),
    );
  }

  Future changePassword() {
    return showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        builder: ((context) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              height: 450,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.grey.shade400 : Colors.grey,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                        Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        obscureText: passwordObscured,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,
                              color:
                              Get.isDarkMode ? Colors.black : Colors.black),
                          hintText: "oldPassword",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        controller: profileController.oldEditingController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                        Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,
                              color:
                              Get.isDarkMode ? Colors.black : Colors.black),
                          hintText: "newPassword",
                          hintStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.black,
                            fontSize: 17,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                        ),
                        controller: profileController.newEditingController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                        Get.isDarkMode ? Colors.grey : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock,
                              color:
                              Get.isDarkMode ? Colors.black : Colors.black),
                          hintText: "prePassword",
                          hintStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.black,
                            fontSize: 17,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                        ),
                        controller: profileController.preEditingController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          profileController.getSave(context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                        child: const Text("Saqlash"),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  )
                ],
              ));
        }));
  }
}
