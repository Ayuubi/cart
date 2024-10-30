import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_item_model.dart';
export 'cart_item_model.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    this.cartDocument,
  });

  final UserCartRecord? cartDocument;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget>
    with TickerProviderStateMixin {
  late CartItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShakeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 4,
            offset: Offset(3.0, 0.0),
            rotation: 0.035,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 60.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.1, -0.8),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Hero(
            tag: widget!.cartDocument!.image,
            transitionOnUserGestures: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget!.cartDocument!.image,
                width: 70.0,
                height: 45.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (animationsMap['stackOnActionTriggerAnimation'] != null) {
              await animationsMap['stackOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0);
            }
            await widget!.cartDocument!.reference.delete();
            if (animationsMap['stackOnActionTriggerAnimation'] != null) {
              animationsMap['stackOnActionTriggerAnimation']!
                  .controller
                  .reset();
            }
          },
          child: Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 10.0,
            ),
          ),
        ),
      ],
    )
        .animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!)
        .animateOnActionTrigger(
          animationsMap['stackOnActionTriggerAnimation']!,
        );
  }
}
