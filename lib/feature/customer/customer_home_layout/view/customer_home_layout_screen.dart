import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/utils/space_Manager.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/view/widgets/customer_home_bottom_nav_bar.dart';

class CustomerHomeLayoutScreen extends StatelessWidget {
  const CustomerHomeLayoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CustomerHomeLayoutCubit cubit = CustomerHomeLayoutCubit.get(context);
    return SafeArea(
      child: Scaffold(
        // appBar: const HomeLayoutAppBar(),
        body: BlocBuilder<CustomerHomeLayoutCubit, CustomerHomeLayoutState>(
          builder: (context, state) => PageView.builder(
            controller: cubit.pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.screens.length,
            onPageChanged: (value) {
              cubit.changePage(index: value);
            },
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsetsDirectional.all(AppPadding.p16),
                  child: cubit.screens[index]);
            },
          ),
        ),
        bottomNavigationBar: const CustomerHomeLayoutBottomNavBar(),
      ),
    );
  }
}
