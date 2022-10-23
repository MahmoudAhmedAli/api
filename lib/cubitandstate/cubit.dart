import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/cubitandstate/state.dart';
import 'package:network/pages/business.dart';
import 'package:network/pages/dio/dio.dart';
import 'package:network/pages/science.dart';
import 'package:network/pages/search.dart';
import 'package:network/pages/settings.dart';
import 'package:network/pages/sports.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(InitalStates());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currnetindex=0;
  List<BottomNavigationBarItem> bottomItems= [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,

      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,

      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,

      ),
      label: 'Science',
    ),

  ];
  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavBar(int index){
    currnetindex=index;
    if(index == 1) {
      getSports();
    }
    if(index == 2) {
      getScience();
    }
    emit(BottomStates());
  }

  List<dynamic> business=[];
  void getbusiness(){
    emit(loadingState());
    if(business.length==0){

      DioHelper.getdata(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'business',
            'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
          }).then((value)
      {
        // print(value.data['totalResults']);
        business = value.data['articles'];
        emit(NewsGetBusinessScucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }else{
      emit(NewsGetBusinessScucessState());

    }


  }


  List<dynamic> sports=[];
  void getSports(){
    emit(loadingSportsState());
    if(sports.length==0){
      DioHelper.getdata(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'sports',
            'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
          }).then((value)
      {
        // print(value.data['totalResults']);
        sports = value.data['articles'];
        emit(NewsGetSportsScucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsScucessState());

    }

  }


  List<dynamic> science=[];
  void getScience(){
    emit(loadingScienceState());
    if(science.length==0){
      DioHelper.getdata(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'science',
            'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
          }).then((value)
      {
        // print(value.data['totalResults']);
        science = value.data['articles'];
        emit(NewsGetScienceScucessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });

    }else{
      emit(NewsGetScienceScucessState());

    }
  }

  List<dynamic> search = [];

  void getsearch(String value) {
    emit(loadingsearchState());
    DioHelper.getdata(
        url: 'v2/everything',
        query:
        {
      'q': '$value',
      'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
    }).then((value) {
      search= value.data['articles'];
      emit(NewsGetSearchScucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }



  bool isdark = true;

  void changemode() {
    isdark = !isdark;

    emit(changemodestate());
  }
}