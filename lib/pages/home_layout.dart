import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/cubitandstate/cubit.dart';
import 'package:network/cubitandstate/state.dart';
import 'package:network/pages/search.dart';


class ApisLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getbusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
////////////////////////////////////////////////////////////
          var cubit= NewsCubit.get(context);
///////////////////////////////////////////////////////////////////
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News APIs'
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => search()));
                    },
                    icon: Icon(Icons.search)) ,

                IconButton(
                    onPressed:(){
                      NewsCubit.get(context).changemode();
                    },
                  icon: Icon(Icons.dark_mode),
                ),
              ],


            ),

            body: cubit.screens[cubit.currnetindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currnetindex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
