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
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
        child: GestureDetector(
          onTap: (){
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
                        border: Border.all(width: 4,color: Colors.white),
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
                          image: AssetImage("assets/images/avatar.png")
                        )
                      ),
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
                        color: Colors.blue
                      ),
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
              const SizedBox(height: 30,),
              const Center(
                child: Text("Asliddin Bo'riyev",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
              ),
              const SizedBox(height: 20,),
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
                  children:  [
                    const SizedBox(
                      width: 22.13,
                    ),
                    const Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 14.13,
                    ),
                    ElevatedButton(
                      child: const Text('Logout',style: TextStyle( color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),),
                        onPressed: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                title: const Text("Chiqish",style: TextStyle(color: Colors.red,fontSize: 20),),
                                content: const Text("Chiqishingizga ishonchingiz komilmi?",style: TextStyle(
                                  color: Colors.grey,fontSize: 17
                                ),),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yo'q",style: TextStyle(color: Colors.green,fontSize: 17),),),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ha",style: TextStyle(color: Colors.red,fontSize: 17),),)
                                ],
                              );
                          },
                          );
                        }),],
                ),
              ),
            ],
          ),
        ),
      )
    );
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
         )
       ),
            builder: ((context){
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                height: 450,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                    borderRadius: const BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50)),
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
                            child:const Text("Saqlash"),
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )
      ),
      builder: ((context){
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50)),
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
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                      child:const Text("Saqlash"),
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )
      ),
      builder: ((context){
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: 450,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding:  const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      checkboxShape: const CircleBorder(),
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
                      checkboxShape: const CircleBorder(),
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
                      checkboxShape: const CircleBorder(),
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
                      child:const Text("Saqlash"),
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
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
    )
    ),
    builder: ((context){
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              height: 450,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      padding:  const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:Get.isDarkMode?Colors.grey:Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CheckboxListTile(
                        checkboxShape: const CircleBorder(),
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
                        checkboxShape: const CircleBorder(),
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
                        checkboxShape: const CircleBorder(),
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
                        child:const Text("Saqlash"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.orange)),
                      ),
                      const SizedBox(width: 30,)
                    ],
                  )
                ],
              )
          );
        }));
  }

}
