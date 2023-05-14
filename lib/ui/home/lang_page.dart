import 'package:app/ui/home/register_page.dart';
import 'package:app/ui/home/sign_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../services/hive_db_service.dart';

class LangPage extends StatefulWidget {
  const LangPage({Key? key}) : super(key: key);

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {

  bool uz=false;
  bool ru=false;
  bool eng=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Get.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor:Get.theme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color:Get.isDarkMode?Colors.white:Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tilingizni\ntanlang!",
                        style: TextStyle(
                            color: Get.isDarkMode?Colors.white:Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
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
              const SizedBox(
                height: 230,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      List<UserModel> user = [];
                      user =  HiveService.readUsers();
                      if(user.isNotEmpty){
                        Get.to(const SignInPage());
                      }else{
                        Get.to(const RegisterPage());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          " Davom etish",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
