
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapps/model/webview/webview.dart';

buildContainer(context,Map list)=>
    InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder:(context)=>WebViews(url:list['url'])));
  },
  child:   Column(



    children: [

      Container(

        height: 160,

        child: Row(

          children: [

            Container(

              height:160 ,

              width: 160,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15.0),

                image: DecorationImage(

                  image: list['urlToImage']== null ? NetworkImage('https://tse2.mm.bing.net/th?id=OIP.qT2YGaXdFi_w2yNPloD33wHaNL&pid=Api&P=0') : NetworkImage('${list['urlToImage']}'),

                  fit: BoxFit.cover,

                ),

              ),

            ),

            SizedBox(

              width: 10.0,

            ),

            Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      '${list['title']}',

                      style: Theme.of(context).textTheme.bodyMedium,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,



                    ),

                  ),

                  SizedBox(

                    height:15.0 ,

                  ),

                  Text(

                    DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(list['publishedAt']) ) ,

                    style:Theme.of(context).textTheme.bodySmall,

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    ],

  ),
);


buildConditionalBuilder(List list)=>ConditionalBuilder(
  condition: list.isNotEmpty ,
  builder:  (context)=>ListView.separated(
    physics: const BouncingScrollPhysics(),
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
  fallback:  (context)=>const Center(child: CircularProgressIndicator(),),
);