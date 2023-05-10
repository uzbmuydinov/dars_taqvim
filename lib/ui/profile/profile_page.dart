import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'components/main_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool uz=false;
  bool ru=false;
  bool eng=false;

  bool us=false;
  bool tal=false;
  bool bol=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Get.theme.backgroundColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  child: Image.asset("assets/images/avatar.png"),
                ),
              ),
              const Text(
                "Qandaharov Alisher",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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
                iconWidget: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
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
                iconWidget: const Icon(
                  Icons.language,
                  color: Colors.black,
                ),
              ),
              MainCard(
                iconWidgetLast: Icon(
                  Icons.arrow_right,
                  size: 25,
                  color: Get.isDarkMode ? Colors.black : Colors.grey,
                ),
                mainText: 'Change role',
                onPressed: () {
                  changeRole();
                },
                iconWidget: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
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
                iconWidget: const Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 54,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                     SizedBox(
                      width: 22.13,
                    ),
                     Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.red,
                    ),
                     SizedBox(
                      width: 14.13,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future editProfile() {
    return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
        context: context,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(20),
           topLeft: Radius.circular(20),
         )
       ),
            builder: ((context){
              return Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                height: 450,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:  TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                  Icons.person,
                                  color: Get.isDarkMode?Colors.black:Colors.black
                              ),
                              hintText: "Alisher",
                              hintStyle: TextStyle(
                                color: Get.isDarkMode?Colors.black:Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:  TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                  Icons.person,
                                  color: Get.isDarkMode?Colors.black:Colors.black
                              ),
                              hintText: "Qandaharov",
                              hintStyle: TextStyle(
                                color: Get.isDarkMode?Colors.black:Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:  TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                  Icons.date_range_outlined,
                                  color: Get.isDarkMode?Colors.black:Colors.black
                              ),
                              hintText: DateFormat("dd.MM.yy").format(DateTime.now(),
                            ),
                          ),
                        ),
                      ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: ()  {
                            },
                            child:Text("Saqlash"),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange)),
                          ),
                          const SizedBox(width: 30,)
                        ],
                      )
                    ],
                  )
              );
            }),
           );
  }
  Future changeLanguage() {
    return  showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )
      ),
      builder: ((context){
        return Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title:  Text('Uzbekcha',style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.black),),
                        secondary:  Icon(Icons.person,color: Get.isDarkMode?Colors.black:Colors.black),
                        autofocus: false,
                        activeColor: Colors.orange,
                        checkColor: Colors.white,
                        value: uz,
                        onChanged: (val){
                          setState(() {
                            uz=val!;
                          });
                        },
                      )
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
                      color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title:  Text('Inglizcha',style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.black),),
                      secondary: Icon(Icons.person,color: Get.isDarkMode?Colors.black:Colors.black),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      value: eng,
                      onChanged: (val){
                        setState(() {
                          eng=val!;
                        });
                      },
                    ), //Che
                  ),),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:CheckboxListTile(
                      checkboxShape: const CircleBorder(),
                      title:  Text('Ruscha',style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.black),),
                      secondary:  Icon(Icons.person,color: Get.isDarkMode?Colors.black:Colors.black),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      value: ru,
                      onChanged: (val){
                        setState(() {
                          ru=val!;
                        });
                      },
                    ), //C
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: ()  {
                      },
                      child:Text("Saqlash"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange)),
                    ),
                    const SizedBox(width: 30,)
                  ],
                )
              ],
            )
        );
      }),
    );
  }
  Future changeRole() {
    return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )
      ),
      builder: ((context){
        return Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding:  EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      // border: Border.all(color: Colors.orange)
                    ),
                    child: CheckboxListTile(
                      checkboxShape: CircleBorder(),
                      title: Text('O\'qituvchi', style: TextStyle(
                        color: Get.isDarkMode?Colors.black:Colors.black,
                      ),),
                      secondary:  Icon(Icons.person,size: 23, color:Get.isDarkMode?Colors.black:Colors.black),
                      autofocus: false,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                      selected: us,
                      value: us,
                      onChanged: (val){
                        setState(() {
                          us=val!;
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
                    padding:  const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  CheckboxListTile(
                      checkboxShape: CircleBorder(),
                      title:  Text('Talaba', style: TextStyle(
                        color: Get.isDarkMode?Colors.black:Colors.black,
                      ),),
                      secondary:  Icon(Icons.person,size: 23,color:Get.isDarkMode?Colors.black:Colors.black),
                      autofocus: false,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      selected: tal,
                      value: tal,
                      onChanged: (val){
                        setState(() {
                          tal=val!;
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
                      color: Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:  CheckboxListTile(
                      checkboxShape: CircleBorder(),
                      title:  Text('O\'quvchi',style: TextStyle(
                        color: Get.isDarkMode?Colors.black:Colors.black,
                      ),),
                      secondary:  Icon(Icons.person,size: 23,color: Get.isDarkMode?Colors.black:Colors.black),
                      autofocus: false,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      selected: bol,
                      value: bol,
                      onChanged: (val){
                        setState(() {
                          bol=val!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: ()  {
                      },
                      child:Text("Saqlash"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange)),
                    ),
                    const SizedBox(width: 30,)
                  ],
                )
              ],
            )
        );
      }),
    );
  }
  Future changePassword() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  Future logout() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

}
