abstract class NewsStates{}
class InitalStates extends NewsStates{}

class BottomStates extends NewsStates{}

class loadingState extends NewsStates{}
class NewsGetBusinessScucessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  late final String error;
  NewsGetBusinessErrorState(this.error);
}


class loadingSportsState extends NewsStates{}
class NewsGetSportsScucessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  late final String error;
  NewsGetSportsErrorState(this.error);
}


class loadingScienceState extends NewsStates{}
class NewsGetScienceScucessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  late final String error;
  NewsGetScienceErrorState(this.error);
}

class loadingsearchState extends NewsStates{}
class NewsGetSearchScucessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  late final String error;
  NewsGetSearchErrorState(this.error);
}

class changemodestate extends NewsStates{}





