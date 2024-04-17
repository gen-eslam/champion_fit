import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/view/widgets/customer_home_bottom_nav_bar.dart';
import 'package:gem_app2/feature/trainer_and_manager/home_layout/data/home_layout_repo.dart';

class CustomerHomeLayoutScreen extends StatelessWidget {
  const CustomerHomeLayoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerHomeLayoutCubit(homeLayoutRepo: HomeLayoutRepoImpl()),
      child: SafeArea(
        child: Scaffold(
          // appBar: const HomeLayoutAppBar(),
          body: BlocBuilder<CustomerHomeLayoutCubit, CustomerHomeLayoutState>(
            builder: (context, state) => PageView.builder(
              controller: CustomerHomeLayoutCubit.get(context).pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: CustomerHomeLayoutCubit.get(context).screens.length,
              onPageChanged: (value) {
                CustomerHomeLayoutCubit.get(context).changePage(index: value);
              },
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsetsDirectional.all(AppPadding.p16),
                    child: CustomerHomeLayoutCubit.get(context).screens[index]);
              },
            ),
          ),
          bottomNavigationBar: const CustomerHomeLayoutBottomNavBar(),
        ),
      ),
    );
  }
}
