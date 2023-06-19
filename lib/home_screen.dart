import 'package:flutter/material.dart';

import 'package:book_app_ui/constants/colors.dart';
import 'package:book_app_ui/constants/image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 35),
              const CustomSearchBox(),
              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(child: Image.asset(AppImages.stackoverflow)),
                  const SizedBox(width: 30),
                  Expanded(child: Image.asset(AppImages.programmerlife)),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'Popular Books',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 25),
              const PopularBooksList(
                bookImage: AppImages.stackoverflow,
                bookTitle: 'Stackoverflow in a nutshell',
                bookAuthor: 'Monsieur Hassan',
                bookPrice: '\$ 69',
              ),
              const PopularBooksList(
                bookImage: AppImages.googling,
                bookTitle: 'The art of Googling Errors',
                bookAuthor: 'Monsieur Hassan',
                bookPrice: '\$ 96',
              ),
              const PopularBooksList(
                bookImage: AppImages.programmerlife,
                bookTitle: 'Life of a programmer',
                bookAuthor: 'Monsieur Hassan',
                bookPrice: '\$ 99',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class PopularBooksList extends StatelessWidget {
  final String bookImage;
  final String bookTitle;
  final String bookAuthor;
  final String bookPrice;

  const PopularBooksList({
    Key? key,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderGrey),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  bookImage,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: 100,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        bookTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        bookAuthor,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.grey,
                            ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        bookPrice,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      style: const TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.black,
        ),
        hintText: 'Find your book',
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: AppColors.black),
        fillColor: AppColors.yellow,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.grid_view,
          size: 30,
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage(AppImages.profile),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
