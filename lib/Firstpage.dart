import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:news_api/Model.dart';
class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool _isLoading=true;
  @override
  void initState(){
    super.initState();
    _getData();
  }
  Newsmodelapi? dataFromAPI;
  _getData()async{
    try { String url="https://dummyjson.com/todos";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode ==200){
        dataFromAPI=Newsmodelapi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {
          
        });
      }
      
    } catch (e) {
    debugPrint (e.toString());  
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 243, 181),
      appBar: AppBar(
        title: Text('TODO'),backgroundColor:const Color.fromARGB(255, 179, 243, 181) ,
      ),
      body:
      _isLoading?
      const Center(
        child: CircularProgressIndicator(),
      )
      :dataFromAPI==null?
      const Center(
        child: Text('Failed to load data'),
      )
      : ListView.separated( separatorBuilder: (context,index){
        return SizedBox(height: 20);

      },
      itemCount:dataFromAPI!.todos.length ,
      itemBuilder: (context, index) {
          final Todo= dataFromAPI!.todos[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Container(
            height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color.fromARGB(255, 199, 240, 201),
          border: Border.all(color: Colors.black,
          width: 2,),
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
                Text("Id:${Todo.id}"),
                SizedBox(height: 10),
                   Text('UsreId:${Todo.userId}'),
                      SizedBox(height: 10),
                  Text('Todo:${Todo.todo}'),
                    SizedBox(height: 10),
                Text('Completed:${Todo.completed}'),
            
              ],
            ),
          ),
          ),
        );
        
      },),
    );
  }
}