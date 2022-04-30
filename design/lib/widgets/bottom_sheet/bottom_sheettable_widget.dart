import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/physics.dart';

enum SlideDirection {
  up,
  down,
}

enum BottomShettableState { open, closed }

class BottomShettableWidget extends StatefulWidget {
  /// The Widget that slides into view. When the
  /// bottomSheet is collapsed and if [collapsed] is null,
  /// then top portion of this Widget will be displayed;
  /// otherwise, [collapsed] will be displayed overtop
  /// of this Widget. If [bottomSheet] and [bottomSheetBuilder] are both non-null,
  /// [bottomSheet] will be used.
  final Widget? bottomSheet;

  /// Provides a [ScrollController]
  final ScrollController? scrollController;

  /// Provides a [ScrollController] and
  /// [ScrollPhysics] to attach to a scrollable object in the bottomSheet that links
  /// the bottomSheet position with the scroll position. Useful for implementing an
  /// infinite scroll behavior. If [bottomSheet] and [bottomSheetBuilder] are both non-null,
  /// [bottomSheet] will be used.
  final Widget Function(ScrollController sc)? bottomSheetBuilder;

  /// The Widget displayed overtop the [bottomSheet] when collapsed.
  /// This fades out as the bottomSheet is opened.
  final Widget? collapsed;

  /// The Widget that lies underneath the sliding bottomSheet.
  /// This Widget automatically sizes itself
  /// to fill the screen.
  final Widget? backgroundContent;

  /// Optional persistent widget that floats above the [bottomSheet] and attaches
  /// to the top of the [bottomSheet]. Content at the top of the bottomSheet will be covered
  /// by this widget. Add padding to the bottom of the `bottomSheet` to
  /// avoid coverage.
  final Widget? header;

  /// Optional persistent widget that floats above the [bottomSheet] and
  /// attaches to the bottom of the [bottomSheet]. Content at the bottom of the bottomSheet
  /// will be covered by this widget. Add padding to the bottom of the `bottomSheet`
  /// to avoid coverage.
  final Widget? footer;

  /// The height of the sliding bottomSheet when fully collapsed.
  final double minHeight;

  /// The height of the sliding bottomSheet when fully open.
  final double maxHeight;

  /// A point between [minHeight] and [maxHeight] that the bottomSheet snaps to
  /// while animating. A fast swipe on the bottomSheet will disregard this point
  /// and go directly to the open/close position. This value is represented as a
  /// percentage of the total animation distance ([maxHeight] - [minHeight]),
  /// so it must be between 0.0 and 1.0, exclusive.
  final double? snapPoint;

  /// A border to draw around the sliding bottomSheet sheet.
  final Border? border;

  /// If non-null, the corners of the sliding bottomSheet sheet are rounded by this [BorderRadiusGeometry].
  final BorderRadiusGeometry? borderRadius;

  /// A list of shadows cast behind the sliding bottomSheet sheet.
  final List<BoxShadow>? boxShadow;

  /// The color to fill the background of the sliding bottomSheet sheet.
  final Color color;

  /// The amount to inset the children of the sliding bottomSheet sheet.
  final EdgeInsetsGeometry? padding;

  /// Empty space surrounding the sliding bottomSheet sheet.
  final EdgeInsetsGeometry? margin;

  /// Set to false to not to render the sheet the [bottomSheet] sits upon.
  /// This means that only the [backgroundContent], [collapsed], and the [bottomSheet]
  /// Widgets will be rendered.
  /// Set this to false if you want to achieve a floating effect or
  /// want more customization over how the sliding bottomSheet
  /// looks like.
  final bool renderPanelSheet;

  /// Set to false to disable the bottomSheet from snapping open or closed.
  final bool panelSnapping;

  /// If non-null, this can be used to control the state of the bottomSheet.
  final BottomSheetController? controller;

  /// If non-null, shows a darkening shadow over the [backgroundContent] as the bottomSheet slides open.
  final bool backdropEnabled;

  /// Shows a darkening shadow of this [Color] over the [backgroundContent] as the bottomSheet slides open.
  final Color backdropColor;

  /// The opacity of the backdrop when the bottomSheet is fully open.
  /// This value can range from 0.0 to 1.0 where 0.0 is completely transparent
  /// and 1.0 is completely opaque.
  final double backdropOpacity;

  /// Flag that indicates whether or not tapping the
  /// backdrop closes the bottomSheet. Defaults to true.
  final bool backdropTapClosesPanel;

  /// If non-null, this callback
  /// is called as the bottomSheet slides around with the
  /// current position of the bottomSheet. The position is a double
  /// between 0.0 and 1.0 where 0.0 is fully collapsed and 1.0 is fully open.
  final void Function(double position)? onBottomSheetSlide;

  /// If non-null, this callback is called when the
  /// bottomSheet is fully opened
  final VoidCallback? onBottomSheetOpened;

  /// If non-null, this callback is called when the bottomSheet
  /// is fully collapsed.
  final VoidCallback? onBottomSheetClosed;

  /// If non-null, this callback is called when the bottomSheet
  /// is fully collapsed with user gesture
  final VoidCallback? onBottomSheetSlideClosed;

  /// If non-null and true, the BottomShettableWidget exhibits a
  /// parallax effect as the bottomSheet slides up. Essentially,
  /// the backgroundContent slides up as the bottomSheet slides up.
  final bool parallaxEnabled;

  /// Allows for specifying the extent of the parallax effect in terms
  /// of the percentage the bottomSheet has slid up/down. Recommended values are
  /// within 0.0 and 1.0 where 0.0 is no parallax and 1.0 mimics a
  /// one-to-one scrolling effect. Defaults to a 10% parallax.
  final double parallaxOffset;

  /// Allows toggling of the draggability of the BottomShettableWidget.
  /// Set this to false to prevent the user from being able to drag
  /// the bottomSheet up and down. Defaults to true.
  final bool isDraggable;

  /// Either SlideDirection.UP or SlideDirection.DOWN. Indicates which way
  /// the bottomSheet should slide. Defaults to UP. If set to DOWN, the bottomSheet attaches
  /// itself to the top of the screen and is fully opened when the user swipes
  /// down on the bottomSheet.
  final SlideDirection slideDirection;

  /// The default state of the bottomSheet; either BottomShettableState.OPEN or BottomShettableState.CLOSED.
  /// This value defaults to BottomShettableState.CLOSED which indicates that the bottomSheet is
  /// in the closed position and must be opened. BottomShettableState.OPEN indicates that
  /// by default the bottomSheet is open and must be swiped closed by the user.
  final BottomShettableState defaultBottomShettableState;

  final bool useBottomViewInsets;

  const BottomShettableWidget({
    Key? key,
    this.bottomSheet,
    this.scrollController,
    this.bottomSheetBuilder,
    this.backgroundContent,
    this.collapsed,
    this.minHeight = 100.0,
    this.maxHeight = 500.0,
    this.snapPoint,
    this.border,
    this.borderRadius,
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
        blurRadius: 8.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
      )
    ],
    this.color = Colors.white,
    this.padding,
    this.margin,
    this.renderPanelSheet = true,
    this.panelSnapping = true,
    this.controller,
    this.backdropEnabled = false,
    this.backdropColor = Colors.black,
    this.backdropOpacity = 0.5,
    this.backdropTapClosesPanel = true,
    this.onBottomSheetSlide,
    this.onBottomSheetOpened,
    this.onBottomSheetClosed,
    this.onBottomSheetSlideClosed,
    this.parallaxEnabled = false,
    this.parallaxOffset = 0.1,
    this.isDraggable = true,
    this.slideDirection = SlideDirection.up,
    this.defaultBottomShettableState = BottomShettableState.closed,
    this.useBottomViewInsets = true,
    this.header,
    this.footer,
  })  : assert(bottomSheet != null || bottomSheetBuilder != null),
        assert(0 <= backdropOpacity && backdropOpacity <= 1.0),
        assert(snapPoint == null || 0 < snapPoint && snapPoint < 1.0),
        super(key: key);

  @override
  _BottomShettableWidgetState createState() => _BottomShettableWidgetState();
}

class _BottomShettableWidgetState extends State<BottomShettableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ac;
  late ScrollController _sc;
  late VoidCallback? onBottomSheetClosed;

  bool _scrollingEnabled = false;
  final _vt = VelocityTracker.withKind(PointerDeviceKind.touch);

  bool _isPanelVisible = true;
  bool _listingOnScrollControllerGesture = false;

  @override
  void initState() {
    super.initState();
    onBottomSheetClosed = widget.onBottomSheetClosed;

    _ac = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        value: widget.defaultBottomShettableState == BottomShettableState.closed
            ? 0.0
            : 1.0 //set the default bottomSheet state (i.e. set initial value of _ac)
        )
      ..addListener(() {
        if (widget.onBottomSheetSlide != null) {
          widget.onBottomSheetSlide!(_ac.value);
        }

        if (widget.onBottomSheetOpened != null && _ac.value == 1.0) {
          widget.onBottomSheetOpened!();
        }

        if (onBottomSheetClosed != null && _ac.value == 0.0) {
          onBottomSheetClosed!();
          onBottomSheetClosed = null;
        }
      });

    // prevent the bottomSheet content from being scrolled only if the widget is
    // draggable and bottomSheet scrolling is enabled
    _sc = widget.scrollController ?? ScrollController();
    _sc.addListener(() {
      if (widget.isDraggable && !_scrollingEnabled) _sc.jumpTo(0);
    });

    if (widget.defaultBottomShettableState == BottomShettableState.open) {
      _setScrollEnabled();
      _setListiningOnScrollControllerGesture();
    }

    widget.controller?._addState(this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.slideDirection == SlideDirection.up
          ? Alignment.bottomCenter
          : Alignment.topCenter,
      children: <Widget>[
        //make the back widget take up the entire back side
        widget.backgroundContent != null
            ? AnimatedBuilder(
                animation: _ac,
                builder: (context, child) {
                  return Positioned(
                    top: widget.parallaxEnabled ? _getParallax() : 0.0,
                    child: child ?? const SizedBox(),
                  );
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: widget.backgroundContent,
                ),
              )
            : Container(),

        //the backdrop to overlay on the backgroundContent
        !widget.backdropEnabled
            ? Container()
            : GestureDetector(
                onVerticalDragEnd: widget.backdropTapClosesPanel
                    ? (DragEndDetails dets) {
                        // only trigger a close if the drag is towards bottomSheet close position
                        if ((widget.slideDirection == SlideDirection.up
                                    ? 1
                                    : -1) *
                                dets.velocity.pixelsPerSecond.dy >
                            0) _close();
                      }
                    : null,
                onTap: widget.backdropTapClosesPanel ? () => _close() : null,
                child: AnimatedBuilder(
                  animation: _ac,
                  builder: (context, _) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,

                      //set color to null so that touch events pass through
                      //to the backgroundContent when the bottomSheet is closed, otherwise,
                      //if a color exists, then touch events won't go through
                      color: _ac.value == 0.0
                          ? null
                          : widget.backdropColor
                              .withOpacity(widget.backdropOpacity * _ac.value),
                    );
                  },
                ),
              ),

        //the actual sliding part
        !_isPanelVisible
            ? Container()
            : _gestureHandler(
                child: AnimatedBuilder(
                  animation: _ac,
                  builder: (context, child) {
                    return Container(
                      height:
                          _ac.value * (widget.maxHeight - widget.minHeight) +
                              widget.minHeight,
                      margin: widget.margin,
                      padding: widget.padding,
                      decoration: widget.renderPanelSheet
                          ? BoxDecoration(
                              border: widget.border,
                              borderRadius: widget.borderRadius,
                              boxShadow: widget.boxShadow,
                              color: widget.color,
                            )
                          : null,
                      child: child,
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      //open bottomSheet
                      Positioned(
                        top: widget.slideDirection == SlideDirection.up
                            ? 0.0
                            : null,
                        bottom: widget.slideDirection == SlideDirection.down
                            ? 0.0
                            : widget.useBottomViewInsets
                                ? _getBottomViewInsetsIfNeeded()
                                : null,
                        width: MediaQuery.of(context).size.width -
                            (widget.margin != null
                                ? widget.margin!.horizontal
                                : 0) -
                            (widget.padding != null
                                ? widget.padding!.horizontal
                                : 0),
                        child: SizedBox(
                          height: widget.maxHeight,
                          child: widget.bottomSheet ??
                              widget.bottomSheetBuilder!(_sc),
                        ),
                      ),

                      // header
                      widget.header != null
                          ? Positioned(
                              top: widget.slideDirection == SlideDirection.up
                                  ? 0.0
                                  : null,
                              bottom:
                                  widget.slideDirection == SlideDirection.down
                                      ? 0.0
                                      : null,
                              child: widget.header ?? const SizedBox(),
                            )
                          : Container(),

                      // footer
                      widget.footer != null
                          ? Positioned(
                              top: widget.slideDirection == SlideDirection.up
                                  ? null
                                  : 0.0,
                              bottom:
                                  widget.slideDirection == SlideDirection.down
                                      ? _getBottomViewInsetsIfNeeded()
                                      : 0.0,
                              child: widget.footer ?? const SizedBox())
                          : Container(),

                      // collapsed bottomSheet
                      Positioned(
                        top: widget.slideDirection == SlideDirection.up
                            ? 0.0
                            : null,
                        bottom: widget.slideDirection == SlideDirection.down
                            ? 0.0
                            : null,
                        width: MediaQuery.of(context).size.width -
                            (widget.margin != null
                                ? widget.margin!.horizontal
                                : 0) -
                            (widget.padding != null
                                ? widget.padding!.horizontal
                                : 0),
                        child: SizedBox(
                          height: widget.minHeight,
                          child: widget.collapsed == null
                              ? Container()
                              : FadeTransition(
                                  opacity:
                                      Tween(begin: 1.0, end: 0.0).animate(_ac),

                                  // if the bottomSheet is open ignore pointers (touch events) on the collapsed
                                  // child so that way touch events go through to whatever is underneath
                                  child: IgnorePointer(
                                      ignoring: _isPanelOpen,
                                      child: widget.collapsed),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  void _setScrollEnabled() {
    if (widget.isDraggable && widget.bottomSheetBuilder != null) {
      _scrollingEnabled = true;
    }
  }

  void _setListiningOnScrollControllerGesture() {
    if (widget.isDraggable && widget.bottomSheetBuilder != null) {
      _listingOnScrollControllerGesture = _isPanelOpen;
    }
  }

  double? _getBottomViewInsetsIfNeeded() {
    return widget.useBottomViewInsets
        ? MediaQuery.of(context).viewInsets.bottom
        : null;
  }

  double _getParallax() {
    if (widget.slideDirection == SlideDirection.up) {
      return -_ac.value *
          (widget.maxHeight - widget.minHeight) *
          widget.parallaxOffset;
    } else {
      return _ac.value *
          (widget.maxHeight - widget.minHeight) *
          widget.parallaxOffset;
    }
  }

  // returns a gesture detector if bottomSheet is used
  // and a listener if bottomSheetBuilder is used.
  // this is because the listener is designed only for use with linking the scrolling of
  // panels and using it for panels that don't want to linked scrolling yields odd results
  Widget _gestureHandler({required Widget child}) {
    if (!widget.isDraggable) return child;

    if (widget.bottomSheet != null) {
      return GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails dets) =>
            _onGestureSlide(dets.delta.dy),
        onVerticalDragEnd: (DragEndDetails dets) =>
            _onGestureEnd(dets.velocity),
        child: child,
      );
    }

    return Listener(
      onPointerDown: (PointerDownEvent p) =>
          _vt.addPosition(p.timeStamp, p.position),
      onPointerMove: (PointerMoveEvent p) {
        _vt.addPosition(p.timeStamp,
            p.position); // add current position for velocity tracking
        _onGestureSlide(p.delta.dy);
      },
      onPointerUp: (PointerUpEvent p) => _onGestureEnd(_vt.getVelocity()),
      child: child,
    );
  }

  // handles the sliding gesture
  void _onGestureSlide(double dy) {
    // only slide the bottomSheet if scrolling is not enabled
    if (!_scrollingEnabled) {
      if (widget.slideDirection == SlideDirection.up) {
        _ac.value -= dy / (widget.maxHeight - widget.minHeight);
      } else {
        _ac.value += dy / (widget.maxHeight - widget.minHeight);
      }
    }

    if (_listingOnScrollControllerGesture &&
        !_scrollingEnabled &&
        !_isPanelOpen) _setListiningOnScrollControllerGesture();

    // if the bottomSheet is open and the user hasn't scrolled, we need to determine
    // whether to enable scrolling if the user swipes up, or disable closing and
    // begin to close the bottomSheet if the user swipes down
    if (_isPanelOpen && _sc.hasClients && _sc.offset <= 0) {
      setState(() {
        if (dy < 0) {
          _scrollingEnabled = true;
        } else {
          _scrollingEnabled = false;
        }
      });
    }
    if (_isPanelOpen &&
        _sc.hasClients &&
        _scrollingEnabled &&
        !_listingOnScrollControllerGesture) {
      _sc.jumpTo(_sc.offset - dy);
    }
  }

  // handles when user stops sliding
  void _onGestureEnd(Velocity v) {
    double minFlingVelocity = 365.0;
    double kSnap = 8;

    //let the current animation finish before starting a new one
    if (_ac.isAnimating) return;

    if (!_listingOnScrollControllerGesture &&
        _scrollingEnabled &&
        _isPanelOpen) {
      _setListiningOnScrollControllerGesture();
      return;
    }

    // if scrolling is allowed and the bottomSheet is open, we don't want to close
    // the bottomSheet if they swipe up on the scrollable
    if (_isPanelOpen && _scrollingEnabled) return;

    //check if the velocity is sufficient to constitute fling to end
    double visualVelocity =
        -v.pixelsPerSecond.dy / (widget.maxHeight - widget.minHeight);

    // reverse visual velocity to account for slide direction
    if (widget.slideDirection == SlideDirection.down) {
      visualVelocity = -visualVelocity;
    }
    // get minimum distances to figure out where the bottomSheet is at
    double d2Close = _ac.value;
    double d2Open = 1 - _ac.value;
    double d2Snap = ((widget.snapPoint ?? 3) - _ac.value)
        .abs(); // large value if null results in not every being the min
    double minDistance = min(d2Close, min(d2Snap, d2Open));

    // check if velocity is sufficient for a fling
    if (v.pixelsPerSecond.dy.abs() >= minFlingVelocity) {
      // snapPoint exists
      if (widget.panelSnapping && widget.snapPoint != null) {
        if (v.pixelsPerSecond.dy.abs() >= kSnap * minFlingVelocity ||
            minDistance == d2Snap) {
          _ac.fling(velocity: visualVelocity);
        } else {
          _flingPanelToPosition(widget.snapPoint!, visualVelocity);
        }

        // no snap point exists
      } else if (widget.panelSnapping) {
        _ac.fling(velocity: visualVelocity);
        _listingOnScrollControllerGesture = true;

        //If visualVelocity is negative bottom sheet will be closed
        if (visualVelocity.isNegative) {
          _listingOnScrollControllerGesture = false;
          widget.onBottomSheetSlideClosed?.call();
        }

        // bottomSheet snapping disabled
      } else {
        _ac.animateTo(
          _ac.value + visualVelocity * 0.16,
          duration: const Duration(milliseconds: 410),
          curve: Curves.decelerate,
        );
      }

      return;
    }

    // check if the controller is already halfway there
    if (widget.panelSnapping) {
      if (minDistance == d2Close) {
        _close();
        widget.onBottomSheetSlideClosed?.call();
      } else if (minDistance == d2Snap) {
        _flingPanelToPosition(widget.snapPoint!, visualVelocity);
      } else {
        _open();
      }
    }
  }

  void _flingPanelToPosition(double targetPos, double velocity) {
    final Simulation simulation = SpringSimulation(
        SpringDescription.withDampingRatio(
          mass: 1.0,
          stiffness: 500.0,
          ratio: 1.0,
        ),
        _ac.value,
        targetPos,
        velocity);

    _ac.animateWith(simulation);
  }

  //---------------------------------
  //BottomSheetController related functions
  //---------------------------------

  //close the bottomSheet
  Future<void> _close() {
    return _ac
        .fling(velocity: -1.0)
        .then((value) => _listingOnScrollControllerGesture = false);
  }

  //open the bottomSheet
  Future<void> _open() {
    return _ac.fling(velocity: 1.0).then((value) {
      _setScrollEnabled();
      _setListiningOnScrollControllerGesture();
    });
  }

  //hide the bottomSheet (completely offscreen)
  Future<void> _hide() {
    return _ac.fling(velocity: -1.0).then((x) {
      setState(() {
        _isPanelVisible = false;
      });
    });
  }

  //show the bottomSheet (in collapsed mode)
  Future<void> _show() {
    return _ac.fling(velocity: -1.0).then((x) {
      setState(() {
        _isPanelVisible = true;
      });
    });
  }

  //animate the bottomSheet position to value - must
  //be between 0.0 and 1.0
  Future<void> _animatePanelToPosition(
    double value, {
    Duration? duration,
    Curve curve = Curves.linear,
  }) {
    assert(0.0 <= value && value <= 1.0);
    return _ac.animateTo(value, duration: duration, curve: curve);
  }

  //animate the bottomSheet position to the snap point
  //REQUIRES that widget.snapPoint != null
  Future<void> _animatePanelToSnapPoint({
    Duration? duration,
    Curve curve = Curves.linear,
  }) {
    assert(widget.snapPoint != null);
    return _ac.animateTo(widget.snapPoint!, duration: duration, curve: curve);
  }

  //set the bottomSheet position to value - must
  //be between 0.0 and 1.0
  set _panelPosition(double value) {
    assert(0.0 <= value && value <= 1.0);
    _ac.value = value;
  }

  //get the current bottomSheet position
  //returns the % offset from collapsed state
  //as a decimal between 0.0 and 1.0
  double get _panelPosition => _ac.value;

  //returns whether or not
  //the bottomSheet is still animating
  bool get _isPanelAnimating => _ac.isAnimating;

  //returns whether or not the
  //bottomSheet is open
  bool get _isPanelOpen => _ac.value == 1.0;

  //returns whether or not the
  //bottomSheet is closed
  bool get _isPanelClosed => _ac.value == 0.0;

  //returns whether or not the
  //bottomSheet is shown/hidden
  bool get _isPanelShown => _isPanelVisible;
}

class BottomSheetController {
  _BottomShettableWidgetState? _bottomShettableState;

  void _addState(_BottomShettableWidgetState bottomShettableState) {
    _bottomShettableState = bottomShettableState;
  }

  /// Determine if the BottomSheetController is attached to an instance
  /// of the BottomShettableWidget (this property must return true before any other
  /// functions can be used)
  bool get isAttached => _bottomShettableState != null;

  /// Closes the sliding bottomSheet to its collapsed state (i.e. to the  minHeight)
  Future<void> close() {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._close();
  }

  /// Opens the sliding bottomSheet fully
  /// (i.e. to the maxHeight)
  Future<void> open() {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._open();
  }

  /// Hides the sliding bottomSheet (i.e. is invisible)
  Future<void> hide() {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._hide();
  }

  /// Shows the sliding bottomSheet in its collapsed state
  /// (i.e. "un-hide" the sliding bottomSheet)
  Future<void> show() {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._show();
  }

  /// Animates the bottomSheet position to the value.
  /// The value must between 0.0 and 1.0
  /// where 0.0 is fully collapsed and 1.0 is completely open.
  /// (optional) duration specifies the time for the animation to complete
  /// (optional) curve specifies the easing behavior of the animation.
  Future<void> animatePanelToPosition(double value,
      {Duration? duration, Curve curve = Curves.linear}) {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    assert(0.0 <= value && value <= 1.0);
    return _bottomShettableState!
        ._animatePanelToPosition(value, duration: duration, curve: curve);
  }

  /// Animates the bottomSheet position to the snap point
  /// Requires that the BottomShettableWidget snapPoint property is not null
  /// (optional) duration specifies the time for the animation to complete
  /// (optional) curve specifies the easing behavior of the animation.
  Future<void> animatePanelToSnapPoint(
      {Duration? duration, Curve curve = Curves.linear}) {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    assert(_bottomShettableState!.widget.snapPoint != null,
        "BottomShettableWidget snapPoint property must not be null");
    return _bottomShettableState!
        ._animatePanelToSnapPoint(duration: duration, curve: curve);
  }

  /// Sets the bottomSheet position (without animation).
  /// The value must between 0.0 and 1.0
  /// where 0.0 is fully collapsed and 1.0 is completely open.
  set panelPosition(double value) {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    assert(0.0 <= value && value <= 1.0);
    _bottomShettableState!._panelPosition = value;
  }

  /// Gets the current bottomSheet position.
  /// Returns the % offset from collapsed state
  /// to the open state
  /// as a decimal between 0.0 and 1.0
  /// where 0.0 is fully collapsed and
  /// 1.0 is full open.
  double get panelPosition {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._panelPosition;
  }

  /// Returns whether or not the bottomSheet is
  /// currently animating.
  bool get isPanelAnimating {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._isPanelAnimating;
  }

  /// Returns whether or not the
  /// bottomSheet is open.
  bool get isPanelOpen {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._isPanelOpen;
  }

  /// Returns whether or not the
  /// bottomSheet is closed.
  bool get isPanelClosed {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._isPanelClosed;
  }

  /// Returns whether or not the
  /// bottomSheet is shown/hidden.
  bool get isPanelShown {
    assert(isAttached,
        "BottomSheetController must be attached to a BottomShettableWidget");
    return _bottomShettableState!._isPanelShown;
  }
}
