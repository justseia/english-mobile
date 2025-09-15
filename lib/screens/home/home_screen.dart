import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/utils/colors.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccess) {}
        },
        builder: (context, state) {
          return Skeletonizer(
            enabled: state is! HomeSuccess,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Home Screen'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
