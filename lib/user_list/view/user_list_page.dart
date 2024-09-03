import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_list_model.dart';
import '../view_model/user_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('Users List',
          style:  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _userList(usersViewModel),
          ],
        ),
      ),
    );
  }

  Widget _userList(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return Center(child:CircularProgressIndicator(color:Colors.blue,strokeWidth:1));
    }
    if (usersViewModel.errorMessage != '') {
      return Center(child:Text(usersViewModel.errorMessage,style:TextStyle(color:Colors.red,fontSize:15),));
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = usersViewModel.userListModel[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'ID: ',
                    style:  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  Text(
                    userModel.id.toString() ?? '',
                    style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal,color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Name: ',
                    style:  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  Text(
                    userModel.name ?? '',
                    style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal,color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Email: ',
                    style:  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  Text(
                    userModel.email ?? '',
                    style:const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          );

        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}
