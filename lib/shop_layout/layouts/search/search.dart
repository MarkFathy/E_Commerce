import 'package:e_commerce/core/components/textfield.dart';
import 'package:e_commerce/shop_layout/layouts/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
    SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


    @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit=SearchCubit.get(context);
        return Scaffold(
          appBar: AppBar(

          ),
          body: Form(
            key:formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SearchTextField(
                    keyboardType: TextInputType.text,
                      hintText: 'Search',
                      controller: searchController,
                      prefixIcon: const Icon(Icons.search),
                      validator: (value) {
                      if (value!.isEmpty)
                        {
                          return 'Enter Text To Search';
                        }
                        return null;
                      },
                    onFieldSubmitted: (String text)
                    {
                      cubit.search(text);
                    },
                  ),
                  if(state is SearchLoadingState)
                  const LinearProgressIndicator(color: Colors.red,),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
