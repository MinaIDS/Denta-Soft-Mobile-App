import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'home_drawer.dart';

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    super.key,
    this.drawerWidth = 250,
    this.onDrawerCall,
    required this.screenView,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.menuView,
    this.drawerIsOpen,
    this.screenIndex,
  });

  final double drawerWidth;
  final Function(DrawerIndex)? onDrawerCall;
  final Widget screenView;
  final Function(bool)? drawerIsOpen;
  final AnimatedIconData animatedIconData;
  final Widget? menuView;
  final DrawerIndex? screenIndex;

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController iconAnimationController;
  late AnimationController animationController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    // Animation controller for the icon
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );

    // Animation controller for drawer sliding
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    iconAnimationController.animateTo(
      1.0,
      duration: const Duration(milliseconds: 0),
      curve: Curves.fastOutSlowIn,
    );

    // Initialize the scroll controller with drawer width
    scrollController = ScrollController(
      initialScrollOffset: widget.drawerWidth,
    );

    // Listen to scroll events to manage the drawer state
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        if (scrollOffset != 1.0) {
          setState(() {
            scrollOffset = 1.0;
            widget.drawerIsOpen?.call(true);
          });
        }
        iconAnimationController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 0),
          curve: Curves.fastOutSlowIn,
        );
      } else if (scrollController.offset > 0 &&
          scrollController.offset < widget.drawerWidth.floor()) {
        iconAnimationController.animateTo(
          (scrollController.offset * 100 / (widget.drawerWidth)) / 100,
          duration: const Duration(milliseconds: 0),
          curve: Curves.fastOutSlowIn,
        );
      } else {
        if (scrollOffset != 0.0) {
          setState(() {
            scrollOffset = 0.0;
            widget.drawerIsOpen?.call(false);
          });
        }
        iconAnimationController.animateTo(
          1.0,
          duration: const Duration(milliseconds: 0),
          curve: Curves.fastOutSlowIn,
        );
      }
    });

    // Post frame callback to initialize the state after the first build
    WidgetsBinding.instance.addPostFrameCallback((_) => getInitState());
  }

  Future<bool> getInitState() async {
    scrollController.jumpTo(widget.drawerWidth);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          child: Row(children: <Widget>[_buildDrawer(), _buildMainScreen()]),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return SizedBox(
      width: widget.drawerWidth,
      height: MediaQuery.of(context).size.height,
      child: AnimatedBuilder(
        animation: iconAnimationController,
        builder: (BuildContext context, Widget? child) {
          return Transform(
            transform: Matrix4.translationValues(
              scrollController.offset,
              0.0,
              0.0,
            ),
            child: HomeDrawer(
              screenIndex: widget.screenIndex ?? DrawerIndex.HOME,
              iconAnimationController: iconAnimationController,
              callBackIndex: (DrawerIndex indexType) {
                onDrawerClick();
                widget.onDrawerCall?.call(indexType);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainScreen() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          boxShadow: <BoxShadow>[
            BoxShadow(color: AppTheme.grey.withOpacity(0.6), blurRadius: 24),
          ],
        ),
        child: Stack(
          children: <Widget>[
            IgnorePointer(
              ignoring: scrollOffset == 1 || false,
              child: widget.screenView,
            ),
            if (scrollOffset == 1.0) InkWell(onTap: () => onDrawerClick()),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 8,
              ),
              child: SizedBox(
                width: AppBar().preferredSize.height - 8,
                height: AppBar().preferredSize.height - 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      AppBar().preferredSize.height,
                    ),
                    child: Center(
                      child:
                          widget.menuView ??
                          AnimatedIcon(
                            icon: widget.animatedIconData,
                            progress: iconAnimationController,
                            color: Colors.white,
                          ),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      onDrawerClick();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDrawerClick() {
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    iconAnimationController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
