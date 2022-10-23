import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/component/component.dart';
import 'package:network/cubitandstate/cubit.dart';
import 'package:network/cubitandstate/state.dart';


class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text("Search"),
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(20))),
                        onChanged: (value) {
                          NewsCubit.get(context).getsearch(value) ;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ConditionalBuilder(
                        condition: list.length>0,
                        builder: (context) => articleBulider(list) ,
                        fallback: (context) => Center(child: CircularProgressIndicator(),),),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}