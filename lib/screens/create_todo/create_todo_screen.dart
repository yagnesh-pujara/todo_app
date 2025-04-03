import 'package:flutter/material.dart';
import 'package:todo_app/database/hive_service.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/utils.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final _todoTitleController = TextEditingController();

  @override
  void dispose() {
    _todoTitleController.clear();
    _todoTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AppColors.geryColor),
        ),
        title: Text(
          'Create New Task',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Title
                TextField(
                  controller: _todoTitleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.bgColor),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32.0),

                //  Description TextField
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.bgColor),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {
          HiveService().addTodo(
            TodoModel(todoTitle: _todoTitleController.text),
          );
          Navigator.pop(context);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.resolveWith((states) {
            return AppColors.blueColor;
          }),
        ),
        child: Text(
          'Create Task',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.whiteColor),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
