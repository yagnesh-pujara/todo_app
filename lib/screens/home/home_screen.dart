import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final day = DateFormat('EEEE').format(DateTime.now());
  final date = DateFormat('MMMM d, y').format(DateTime.now());
  final int itemCount = 0;

  final todoTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readTodo();
  }

  void createTodo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(16.0),
          title: Text(
            'Create New Task',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TextField(
              controller: todoTitleController,
              decoration: InputDecoration(
                hintText: 'Enter Todo Title',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.bgColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                context.read<TodoProvider>().createTodoTask(
                  todoTitleController.text,
                );
                todoTitleController.clear();
                Navigator.pop(context);
              },
              color: AppColors.blueColor,
              textColor: AppColors.whiteColor,
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void readTodo() {
    context.read<TodoProvider>().getAllTodoTask();
  }

  void updateTodo(int index, String data) {
    final tempController = TextEditingController();
    tempController.text = data;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(16.0),
          title: Text(
            'Update Task',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TextField(
              controller: tempController,
              decoration: InputDecoration(
                hintText: 'Enter Todo Title',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.bgColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                context.read<TodoProvider>().createTodoTask(
                  todoTitleController.text,
                );
                todoTitleController.clear();
                Navigator.pop(context);
              },
              color: AppColors.blueColor,
              textColor: AppColors.whiteColor,
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    List<TodoModel> todoList = todoProvider.getAllTodoTask();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 38.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello Friend 👋',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Icon(
                        Icons.dark_mode_outlined,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  Text(
                    'Ready to do your Daily Tasks ??',
                    style: Theme.of(context).textTheme.displayLarge,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(height: 16.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Today\'s ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: day,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),

                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.geryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(thickness: 2, color: AppColors.blackColor, indent: 150),

            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 38.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ongoing',
                        style: Theme.of(context).textTheme.displayLarge,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                      Image.asset(
                        AppAssets.calendarIcon,
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  todoList.isNotEmpty
                      ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          final todo = todoList[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(color: AppColors.bgColor),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todoList[index].todoTitle,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          color: AppColors.blueColor.withValues(
                                            alpha: 32,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.mode_edit_outlined,
                                            color: AppColors.bgColor,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          color: AppColors.redColor.withValues(
                                            alpha: 24,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            todoProvider.deleteTodoTask(index);
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: AppColors.bgColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                      : Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 64.0),
                          child: Image.asset(
                            AppAssets.noTaskFound,
                            height: 240,
                            width: 240,
                            fit: BoxFit.cover,
                            opacity: AlwaysStoppedAnimation(0.25),
                          ),
                        ),
                      ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CreateTodoScreen()),
          // );
          createTodo();
        },
        backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.whiteColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
