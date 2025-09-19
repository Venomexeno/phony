import 'package:flutter/material.dart';

import '../../extensions/color_opacity_extension.dart';
import '../../style/app_colors.dart';

class BottomNavBarPainter extends CustomPainter {
  BottomNavBarPainter({
    required this.notchCenterX,
    required this.color,
  });

  final double notchCenterX;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    const double cornerRadius = 10; // عرض الحواف العلوية
    const double notchWidth = 25; // عرض الـ notch (أعرض من قبل)
    const double notchDepth = 20; // عمق الـ notch (أقل من قبل لجعله أقصر)
    const double smoothRadius = 8; // نصف قطر المنحنيات الانتقالية

    // نبدأ من أعلى اليسار مع منحنى بسيط
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // الخط العلوي لحد بداية الانتقال للـ notch
    path.lineTo(notchCenterX - notchWidth - smoothRadius, 0);

    // منحنى ناعم للدخول إلى الـ notch
    path.quadraticBezierTo(
      notchCenterX - notchWidth,
      0,
      notchCenterX - notchWidth + smoothRadius,
      smoothRadius * 0.7,
    );

    // الجزء السفلي من الـ U - منحنى عريض وقصير
    path.quadraticBezierTo(
      notchCenterX,
      notchDepth, // نقطة الوسط بعمق أقل
      notchCenterX + notchWidth - smoothRadius,
      smoothRadius * 0.7,
    );

    // منحنى ناعم للخروج من الـ notch
    path.quadraticBezierTo(
      notchCenterX + notchWidth,
      0,
      notchCenterX + notchWidth + smoothRadius,
      0,
    );

    // باقي الخط العلوي لحد قبل الركن اليمين
    path.lineTo(size.width - cornerRadius, 0);

    // منحنى الركن العلوي اليمين
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // الجوانب
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    // نرسم shadow محدد
    final Paint shadowPaint = Paint()
      ..color = AppColors.grey.toOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 20);

    // نرسم الظل بإزاحة للأعلى
    final Path shadowPath = path.shift(const Offset(0, -1));
    canvas.drawPath(shadowPath, shadowPaint);

    // نرسم الخلفية
    final Paint paint = Paint()..color = color;
    canvas.drawPath(path, paint);

    // نرسم border خفيف للتحديد - شفاف تماماً
    final Paint borderPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant BottomNavBarPainter oldDelegate) {
    return oldDelegate.notchCenterX != notchCenterX;
  }
}
