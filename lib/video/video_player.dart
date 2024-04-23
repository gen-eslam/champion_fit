import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_app2/core/helpers/extensions.dart';
import 'package:gem_app2/core/theme/manager/text_style_manager.dart';
import 'package:gem_app2/core/widgets/custom_loading.dart';
import 'package:gem_app2/core/widgets/custom_text.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )..initialize().then((controller) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.deviceWidth,
                height: context.deviceHeight * 0.3,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller),
                ),
              ),
              SizedBox(height: 10.h),
              StatefulBuilder(builder: (context, setState) {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {});
                });
                return CustomText(
                  text: "${_controller.value.position.inSeconds} seconds",
                  style: TextStyleManager.textStyle20w400,
                );
              }),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                      setState(() {});
                    },
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.value.isLooping
                          ? _controller.setLooping(false)
                          : _controller.setLooping(true);
                      setState(() {});
                    },
                    icon: Icon(
                      _controller.value.isLooping
                          ? Icons.loop
                          : Icons.one_x_mobiledata_outlined,
                    ),
                  ),
                ],
              ),
            ],
          )
        : SizedBox(
            width: context.deviceWidth,
            height: context.deviceHeight * 0.3,
            child: const CustomLoading(),
          );
  }
}
