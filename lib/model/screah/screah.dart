import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapps/layout/cubit/cubit.dart';
import 'package:newsapps/layout/cubit/states.dart';
import 'package:newsapps/shered/components/components.dart';
import 'package:newsapps/shered/constant/constant.dart';

class Search extends StatelessWidget {
   Search({Key? key}) : super(key: key);
   var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context , state){},
      builder: (context ,state ) {
        var list=NewsAppCubit.get(context).search;

        return SafeArea(

          child: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                     onChanged: (values){
                      NewsAppCubit.get(context).getDataSearch(value: values );
                     },
                    enabled: true,

                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'pleas search';

                      }
                    },
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: Icon(Icons.search_outlined),
                      label: NewsAppCubit.get(context).currentLanguage=='En'? Text('Search'): Text('البحث'),
                    ),
                  ),
                ),
               const SizedBox(height: 15.0),
                   Expanded(
                     child: ConditionalBuilder(
            condition: list.isNotEmpty ,
            builder:  (context)=>ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context ,index)=>buildContainer(context,list[index]) ,
              separatorBuilder:(context ,index)=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1.0,
                ),
              ),
              itemCount: list.length,
            ),
            fallback:  (context)=>const Center(heightFactor: 20,child: Text('Not found'),),
          ),
                   ),
              ],
            ),
          ),
        );
      }
    );
  }
}
