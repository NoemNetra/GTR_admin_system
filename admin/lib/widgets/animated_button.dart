
import 'package:flutter/material.dart';

class AnimatedActionButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;

  const AnimatedActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color = const Color(0xFF6366F1),
  });

  @override
  State<AnimatedActionButton> createState() =>
      _AnimatedActionButtonState();
}

class _AnimatedActionButtonState
    extends State<AnimatedActionButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => isPressed = true);
        },
        onTapUp: (_) {
          setState(() => isPressed = false);
        },
        onTapCancel: () {
          setState(() => isPressed = false);
        },
        child: AnimatedScale(
          scale: isPressed ? 0.94 : 1.0,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          child: Material(
            color: widget.color,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: widget.onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
