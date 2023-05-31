import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapps/layout/cubit/cubit.dart';
import 'package:newsapps/layout/cubit/states.dart';
import 'package:newsapps/layout/layout_NewsApps.dart';
import 'package:newsapps/shered/blocobserve/blocobserve.dart';
import 'package:newsapps/shered/constant/constant.dart';
import 'package:newsapps/shered/network/remot/dio.dart';
import 'package:newsapps/shered/network/remot/sharedpreferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=const SimpleBlocObserver();
  DioHelpers.initial();
  await SharedPreference.initial();
   dark=SharedPreference.getDataBool(key: 'isDark');
   en=SharedPreference.getDataString(key: 'En');
print(dark);
  print(en);
  print(ag);

  runApp( MyApp(dark: dark,en: en,));
}

class MyApp extends StatelessWidget {
    final bool? dark;
    final String? en;
   // final String? en;

  const MyApp({super.key, this.dark,this.en});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>NewsAppCubit()..getDataBusiness()..getDataBusinessArbic()..changeDarkMode(isDark: dark)..changeLanguage(maina: en)),
      ],

      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){},
          builder: (context,state) {
          var cubit=NewsAppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                iconColor: Colors.white,
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelStyle: TextStyle(color:Colors.white, ),
              ),

              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: defaultColor,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness:Brightness.light ,
                  statusBarColor: HexColor('333739'),
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                actionsIconTheme: IconThemeData(
                  color: defaultColor,
                  size: 25.0,
                ),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: defaultColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,

                ),
              ),
              scaffoldBackgroundColor:  HexColor('333739'),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                elevation: 20.0,
                selectedItemColor: defaultColor,
                unselectedItemColor: Colors.grey,
                type:BottomNavigationBarType.fixed,
              ),
              primarySwatch:Colors.deepOrange,
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
                bodySmall: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ),
            theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                iconColor: defaultColor,
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: defaultColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: defaultColor,
                  ),
                ),
                prefixIconColor: defaultColor,
                labelStyle: TextStyle(color:defaultColor, ),

              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: defaultColor,
                ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness:Brightness.dark ,

              ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                actionsIconTheme: IconThemeData(
                  color: defaultColor,
                  size: 25.0,
                ),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: defaultColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,

                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 20.0,
                selectedItemColor: defaultColor,
                unselectedItemColor: Colors.grey,
                type:BottomNavigationBarType.fixed,
              ),
              primarySwatch:Colors.deepOrange,
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
                bodySmall: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ),
              themeMode: cubit.darkMode? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection:  cubit.currentLanguage=='En'?TextDirection.ltr:TextDirection.rtl,
                child: LayoutNewsApp(),
            ),
          );
        }
      ),
    );
  }
}




