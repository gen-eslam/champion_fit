import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/feature/customer/customer_home_layout/logic/customer_home_layout_cubit.dart';

class CustomerHomeLayoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomerHomeLayoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: BlocBuilder<CustomerHomeLayoutCubit, CustomerHomeLayoutState>(
          builder: (context, state) => Text(
              CustomerHomeLayoutCubit.get(context).appBarTitles[
                  CustomerHomeLayoutCubit.get(context).currentIndex])),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 40.h);
}
