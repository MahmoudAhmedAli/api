import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:network/pages/web_view.dart';

Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    //var index;
    Navigator.push(
        context,

        MaterialPageRoute(
            builder: (context) => webview('${article['url']}')));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width:120,
  
          height: 120,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0),
  
            image: DecorationImage(
  
              image: NetworkImage('${article['urlToImage']}'),
  
  
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              mainAxisSize: MainAxisSize.min,
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    '${article['title']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 4,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  '${article['publishedAt']}',
  
                  style: TextStyle(
  
                    color: Colors.grey,
  
  
  
                  ),
  
                )
  
              ],
  
            ),
  
          ),
  
        ),
  
  
  
      ],
  
    ),
  
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget articleBulider(list)=>ConditionalBuilder(
  condition:list.length>0 ,
  builder:(context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (BuildContext context, int index)=>buildArticleItem(list[index],context),
    separatorBuilder:(context,index)=> myDivider(),
    itemCount: 10,
  ),
  fallback: (context)=>Center(child: CircularProgressIndicator()),
);