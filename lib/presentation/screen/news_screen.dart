
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/data/api/api_manager.dart';
import 'package:flutter_web/presentation/widget/news.dart';
import 'package:flutter_web/presentation/cubit/news_cubit.dart';
import 'package:flutter_web/presentation/widget/news_item.dart';

class NewsScreen extends StatefulWidget {

  ApiManager? apiManager;



  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

NewsCubit viewModel = NewsCubit();

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(viewModel.source?.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
          );
        } else if (state is NewsError) {
          return Column(
            children: [
              const Text('Something went wrong '),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNews(viewModel.source?.id);
                    setState(() {});
                  },
                  child: const Text('Try Again'))
            ],
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return News(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
          );
        }
        return Container(color: Colors.red,);
      },
    );
  }
}