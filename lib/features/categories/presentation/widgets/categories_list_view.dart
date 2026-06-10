import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/error_indicator.dart';
import 'package:e_commerce/core/widgets/loading_indicator.dart';
import 'package:e_commerce/features/categories/presentation/cubit/category_cubit.dart';
import 'package:e_commerce/features/categories/presentation/cubit/category_states.dart';
import 'package:e_commerce/features/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: BlocProvider(
        create: (context) => serviceLocator.get<CategoryCubit>(),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is GetCategoriesLoading) {
              return const SliverToBoxAdapter(child: LoadingIndicator());
            } else if (state is GetCategoriesError) {
              return SliverToBoxAdapter(child: ErrorIndicator(state.message));
            } else if (state is GetCategoriesSuccess) {
              return SliverGrid.builder(
                itemCount: state.categories.length,
                gridDelegate: customDelegate(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.categoryProducts,
                        //arguments: category.id
                        //arguments: categories[index].name,
                      );
                    },
                    child: CategoryCard(state.categories[index]),
                  );
                },
              );
            } else {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }
          },
        ),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount customDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 8,
      childAspectRatio: 163 / 200,
    );
  }
}
