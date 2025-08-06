import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/feature_item_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/Assets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width-32;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                  right: itemWidth * 0.4,
                  bottom: 0,
                  left: 0,
                  top: 0,
                  child: SvgPicture.asset(
                    Assets.imagesPageViewItem2Image,
                    fit: BoxFit.fill,
                  )),
              Container(
                
                width: itemWidth / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: svg.Svg(Assets.imagesFeaturedItemBackground),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'خصم 10%',
                        style: TextStyles.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      FeatureItemButton(onPressed: () {}),
                      SizedBox(
                        height: 29,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
