import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapps/layout/cubit/cubit.dart';
import 'package:newsapps/layout/cubit/states.dart';
import 'package:newsapps/shered/constant/constant.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state) {
        var cubit=NewsAppCubit.get(context);
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cubit.currentLanguage == 'En'?   Text("Mode",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),):Text("الحاله",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      SizedBox(width: 15.0,),
                      CupertinoSwitch(
                        activeColor: Colors.green,
                          trackColor: Colors.grey,
                          value: cubit.darkMode ,
                          onChanged: (value){
                            cubit.changeDarkMode();
                          },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cubit.currentLanguage == 'En'? Text('language',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),):Text('لغه',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      SizedBox(width: 15.0,),
                      DropdownButton(
                        focusColor: Colors.black,
                          value: cubit.currentLanguage ,
                          items: cubit.language
                              .map((e) =>
                              DropdownMenuItem(
                                child: Text(e),
                               value: e,
                              )).toList(),
                          onChanged: (item){
                            cubit.changeLanguage(item: item);
                          },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
