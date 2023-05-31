import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapps/layout/cubit/cubit.dart';
import 'package:newsapps/layout/cubit/states.dart';
import 'package:newsapps/model/screah/screah.dart';
import 'package:newsapps/shered/constant/constant.dart';

class LayoutNewsApp extends StatelessWidget {
  const LayoutNewsApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit=NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: cubit.currentLanguage=="En"?cubit.titleScreen[cubit.currentIndex]:cubit.titleScreenArbic[cubit.currentIndex],
            actions: [
              IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
              },
              icon: const Icon(Icons.search_outlined ),
          ),
            ],
          ),
          body:cubit.screen[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.currentLanguage=="En"?cubit.itemBottom:cubit.itemBottomArbic,
            onTap: (int index){
              cubit.changeBottomNavBar(index: index);
            },
            currentIndex:cubit.currentIndex ,
          ),
        );
      }
    );
  }
}
