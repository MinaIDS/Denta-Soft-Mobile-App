import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T? model;
  final Widget? child;
  final void Function(T)? initState;

  final Widget Function(BuildContext context, T model, S local, Widget? child)?
  builder;

  // Making sure that initState and builder are nullable with null safety
  const BaseWidget({
    super.key,
    this.model,
    this.builder,
    this.initState,
    this.child,
  });

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T
  model; // `late` indicates that the variable is non-nullable but will be initialized later

  @override
  void initState() {
    super.initState();
    // Initialize the model and call initState callback
    model = widget.model!;
    widget.initState!(model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        child: widget.child,
        builder: (context, model, child) =>
            widget.builder!(context, model, S.of(context)!, child),
      ),
    );
  }
}
