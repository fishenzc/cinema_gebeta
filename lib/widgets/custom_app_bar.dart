import 'package:flutter/material.dart';
import '../assets.dart';

class CustomAppBar extends StatelessWidget {
 final double scrolleOffSet;

  const CustomAppBar({Key? key, this.scrolleOffSet = 0.0,}) : super(key: key);

  // const CustomAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color: Colors.black.withOpacity((scrolleOffSet/350).clamp(0,1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 _AppBarButton(title: 'TV Shows', onTap: () => 'TV Shows'),
                 _AppBarButton(title: 'Movies', onTap: () => 'Movies'),
                 _AppBarButton(title: 'MyList', onTap: () => 'MyList'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  // const _AppBarButton({ Key? key }) : super(key: key);
  final String title;
  final Function onTap;

  const _AppBarButton(
    {Key? key, required this.title, required this.onTap}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                    onTap: () => onTap,
                    child: Text(title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        )));
  }
}
