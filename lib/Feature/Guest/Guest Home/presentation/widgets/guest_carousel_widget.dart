import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GuestCarouselWidget extends StatefulWidget {
  @override
  _GuestCarouselWidgetState createState() => _GuestCarouselWidgetState();
}

class _GuestCarouselWidgetState extends State<GuestCarouselWidget> {
  PageController _controller = PageController();
  int currentIndex = 0;
  final List<String> images = [
    'assets/image/doctors1.png',
    'assets/image/doctors2.png',
    'assets/image/doctors3.png',
  ];

  @override
  void initState() {
    super.initState();
    // Auto slide
    Future.delayed(const Duration(seconds: 3), autoSlide);
  }

  void autoSlide() {
    if (_controller.hasClients) {
      int next = _controller.page!.round() + 1;
      if (next == images.length) next = 0;
      _controller.animateToPage(next, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      Future.delayed(const Duration(seconds: 3), autoSlide);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(images[index], fit: BoxFit.cover),
              );
            },
          ),
        ),
        const Gap( 8),
        SmoothPageIndicator(
          controller: _controller,
          count: images.length,
          effect: const WormEffect(dotHeight: 8, dotWidth: 8, activeDotColor: Colors.blue),
        ),
      ],
    );
  }
}
