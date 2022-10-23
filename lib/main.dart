
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:network/bloc_server.dart';
import 'package:network/cubitandstate/cubit.dart';
import 'package:network/cubitandstate/state.dart';
import 'package:network/pages/dio/dio.dart';
import 'package:network/pages/home_layout.dart';



void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener:(context,state){

        } ,
        builder:(context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness:Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                    color: Colors.black
                ),

              ),
              floatingActionButtonTheme:FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ) ,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(

                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,

              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness:Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                    color: Colors.white
                ),

              ),
              floatingActionButtonTheme:FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ) ,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),

              scaffoldBackgroundColor:HexColor('333739'),

              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,

            home: ApisLayout(),
          );
        } ,
      ),
    );
  }
}
