import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/cubitandstate/cubit.dart';
import 'package:network/cubitandstate/state.dart';



import '../../component/component.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var list= NewsCubit.get(context).business;
        return articleBulider(list);
      },
    );
  }

}
