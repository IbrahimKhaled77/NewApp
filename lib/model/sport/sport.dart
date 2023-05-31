import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapps/layout/cubit/cubit.dart';
import 'package:newsapps/layout/cubit/states.dart';
import 'package:newsapps/shered/components/components.dart';
import 'package:newsapps/shered/constant/constant.dart';
class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){

        },
        builder: (context ,state) {
          var cubit=NewsAppCubit.get(context);
          var listA=NewsAppCubit.get(context).sportArbic;
          var list=NewsAppCubit.get(context).sport;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: en=='En'? buildConditionalBuilder(list):buildConditionalBuilder(listA),
          );
        }
    );
  }
}
