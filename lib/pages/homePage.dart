

import 'package:flutter/material.dart';
import 'package:news_app/const/const.dart';
import 'package:news_app/pages/allNews.dart';
import 'package:news_app/pages/breakingNews.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold( 
      appBar: AppBar(  
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        title: Const.text('News', 23, Colors.white, FontWeight.w800), 
        bottom:  const TabBar( 
          
        labelStyle: TextStyle(
          color: Colors.black
        ),
          tabs: [ 
          Tab(text: 'All News',),            
          Tab(text: 'Breaking News')
        ]),
      ), 
      body: 
       const SafeArea(child: TabBarView(
        
        children: [
                AllNews(),
                BreakingNews (), ],))
      
     
    
    ));
  }
}