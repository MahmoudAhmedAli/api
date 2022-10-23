import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/component/component.dart';
import 'package:network/cubitandstate/cubit.dart';
import 'package:network/cubitandstate/state.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var list= NewsCubit.get(context).sports;
        return articleBulider(list);
      },
    );
  }
}
