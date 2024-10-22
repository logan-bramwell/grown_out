
/*
typedef DropzoneViewCreatedCallback = void Function(
    DropzoneViewController controller);

// https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API
// https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API/File_drag_and_drop

class DropzoneView extends StatefulWidget {
  final DragOperation? operation;
  final CursorType? cursor;
  final List<String>? mime;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;
  final DropzoneViewCreatedCallback? onCreated;

  /// Event called when the dropzone view has been loaded.
  final VoidCallback? onLoaded;

  /// Event called if the dropzone view has an error.
  final ValueChanged<String?>? onError;

  /// Event called when the dropzone view is hovered during a drag-drop.
  final VoidCallback? onHover;

  /// Event called when the user drops a file onto the dropzone.
  final ValueChanged<dynamic>? onDrop;

  /// Event called when the user tries to drop an invalid file onto the dropzone.
  final ValueChanged<String?>? onDropInvalid;

  /// Event called when the user drops multiple files onto the dropzone.
  final ValueChanged<List<dynamic>?>? onDropMultiple;

  /// Event called when the user leaves a dropzone.
  final VoidCallback? onLeave;

  const DropzoneView({
    Key? key,
    this.operation,
    this.cursor,
    this.mime,
    this.gestureRecognizers,
    this.onCreated,
    this.onLoaded,
    this.onError,
    this.onHover,
    this.onDrop,
    this.onDropInvalid,
    this.onDropMultiple,
    this.onLeave,
  })  : assert(onDrop != null || onDropMultiple != null,
  'Either onDrop or onDropMultiple is required'),
        super(key: key);

  @override
  State<DropzoneView> createState() => _DropzoneViewState();
}

class _DropzoneViewState extends State<DropzoneView> {
  final _controller = Completer<DropzoneViewController>();

  @override
  Widget build(BuildContext context) {
    final params = <String, dynamic>{
      'operation': widget.operation,
      'cursor': widget.cursor,
      'mime': widget.mime,
    };
    return FlutterDropzonePlatform.instance
        .buildView(params, widget.gestureRecognizers, (viewId) {
      final ctrl = DropzoneViewController._create(viewId, widget);
      _controller.complete(ctrl);
      widget.onCreated?.call(ctrl);
      FlutterDropzonePlatform.instance.init(params, viewId: viewId);
    });
  }
}

class DropzoneViewController {
  final int viewId;
  final DropzoneView widget;

  DropzoneViewController._create(this.viewId, this.widget) {
    if (widget.onLoaded != null) {
      FlutterDropzonePlatform.instance //
          .onLoaded(viewId: viewId)
          .listen((_) => widget.onLoaded!());
    }
    if (widget.onError != null) {
      FlutterDropzonePlatform.instance //
          .onError(viewId: viewId)
          .listen((msg) => widget.onError!(msg.value));
    }
    if (widget.onHover != null) {
      FlutterDropzonePlatform.instance //
          .onHover(viewId: viewId)
          .listen((msg) => widget.onHover!());
    }
    if (widget.onDrop != null) {
      FlutterDropzonePlatform.instance //
          .onDrop(viewId: viewId)
          .listen((msg) => widget.onDrop!(msg.value));
    }
    if (widget.onDropInvalid != null) {
      FlutterDropzonePlatform.instance //
          .onDropInvalid(viewId: viewId)
          .listen((msg) => widget.onDropInvalid!(msg.value));
    }
    if (widget.onDropMultiple != null) {
      FlutterDropzonePlatform.instance //
          .onDropMultiple(viewId: viewId)
          .listen((msg) => widget.onDropMultiple!(msg.value));
    }
    if (widget.onLeave != null) {
      FlutterDropzonePlatform.instance //
          .onLeave(viewId: viewId)
          .listen((msg) => widget.onLeave!());
    }
  }

  /// Specify the [DragOperation] while dragging the file.
  Future<bool> setOperation(DragOperation operation) {
    return FlutterDropzonePlatform.instance
        .setOperation(operation, viewId: viewId);
  }

  /// Specify the [CursorType] of the dropzone. [CursorType] is one the CSS cursor types.
  Future<bool> setCursor(CursorType cursor) async {
    return FlutterDropzonePlatform.instance.setCursor(cursor, viewId: viewId);
  }

  /// Specify the list of accepted MIME types.
  Future<bool> setMIME(List<String> mimes) {
    return FlutterDropzonePlatform.instance.setMIME(mimes, viewId: viewId);
  }

  /// Convenience function to display the browser File Open dialog.
  ///
  /// Set [multiple] to allow picking more than one file.
  /// Returns the list of files picked by the user.
  Future<List<dynamic>> pickFiles(
      {bool multiple = false, List<String> mime = const []}) {
    return FlutterDropzonePlatform.instance
        .pickFiles(multiple, mime: mime, viewId: viewId);
  }

  /// Get the filename of the passed HTML file.
  Future<String> getFilename(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .getFilename(htmlFile, viewId: viewId);
  }

  /// Get the size of the passed HTML file.
  Future<int> getFileSize(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .getFileSize(htmlFile, viewId: viewId);
  }

  /// Get the MIME type of the passed HTML file.
  Future<String> getFileMIME(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .getFileMIME(htmlFile, viewId: viewId);
  }

  /// Get the last modified date of the passed HTML file.
  Future<DateTime> getFileLastModified(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .getFileLastModified(htmlFile, viewId: viewId);
  }

  /// Create a temporary URL to the passed HTML file.
  ///
  /// When finished, the URL should be released using [releaseFileUrl()].
  Future<String> createFileUrl(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .createFileUrl(htmlFile, viewId: viewId);
  }

  /// Release a temporary URL previously created using [createFileUrl()].
  Future<bool> releaseFileUrl(String fileUrl) {
    return FlutterDropzonePlatform.instance
        .releaseFileUrl(fileUrl, viewId: viewId);
  }

  /// Get the contents of the passed HTML file.
  Future<Uint8List> getFileData(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .getFileData(htmlFile, viewId: viewId);
  }

  /// Get the contents of the passed HTML file as a chunked stream.
  Stream<List<int>> getFileStream(dynamic htmlFile) {
    return FlutterDropzonePlatform.instance
        .getFileStream(htmlFile, viewId: viewId);
  }
}

enum DragOperation { copy, move, link, copyMove, copyLink, linkMove, all }

enum CursorType {
  alias,
  all_scroll,
  auto,
  cell,
  context_menu,
  col_resize,
  copy,
  crosshair,
  Default,
  e_resize,
  ew_resize,
  grab,
  grabbing,
  help,
  move,
  n_resize,
  ne_resize,
  nesw_resize,
  ns_resize,
  nw_resize,
  nwse_resize,
  no_drop,
  none,
  not_allowed,
  pointer,
  progress,
  row_resize,
  s_resize,
  se_resize,
  sw_resize,
  text,
  w_resize,
  wait,
  zoom_in,
  zoom_out
}

abstract class FlutterDropzonePlatform extends PlatformInterface {
  static final _token = Object();
  final events = StreamController<DropzoneEvent>.broadcast();
  static FlutterDropzonePlatform _instance = MethodChannelFlutterDropzone();

  FlutterDropzonePlatform() : super(token: _token);

  /// The default instance of [FlutterDropzonePlatform] to use.
  static FlutterDropzonePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterDropzonePlatform] when they register themselves.
  static set instance(FlutterDropzonePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Internal function to set up the platform view.
  void init(Map<String, dynamic> params, {required int viewId}) {
    throw UnimplementedError('init');
  }

  /// Specify the [DragOperation] while dragging the file.
  Future<bool> setOperation(DragOperation operation,
      {required int viewId}) async {
    throw UnimplementedError('setOperation');
  }

  /// Specify the [CursorType] of the dropzone. [CursorType] is one the CSS cursor types.
  Future<bool> setCursor(CursorType cursor, {required int viewId}) async {
    throw UnimplementedError('setCursor');
  }

  /// Specify the list of accepted MIME types.
  Future<bool> setMIME(List<String> mime, {required int viewId}) async {
    throw UnimplementedError('setMIME');
  }

  /// Convenience function to display the browser File Open dialog.
  ///
  /// Set [multiple] to allow picking more than one file.
  /// Specify the list of accepted MIME types in [mime].
  /// Returns the list of files picked by the user.
  Future<List<dynamic>> pickFiles(bool multiple,
      {List<String> mime = const [], required int viewId}) async {
    throw UnimplementedError('pickFiles');
  }

  /// Get the filename of the passed HTML file.
  Future<String> getFilename(dynamic htmlFile, {required int viewId}) async {
    throw UnimplementedError('getFilename');
  }

  /// Get the size of the passed HTML file.
  Future<int> getFileSize(dynamic htmlFile, {required int viewId}) async {
    throw UnimplementedError('getFileSize');
  }

  /// Get the MIME type of the passed HTML file.
  Future<String> getFileMIME(dynamic htmlFile, {required int viewId}) async {
    throw UnimplementedError('getFileMIME');
  }

  /// Get the last modified data of the passed HTML file.
  Future<DateTime> getFileLastModified(dynamic htmlFile,
      {required int viewId}) async {
    throw UnimplementedError('getFileLastModified');
  }

  /// Create a temporary URL to the passed HTML file.
  ///
  /// When finished, the URL should be released using [releaseFileUrl()].
  Future<String> createFileUrl(dynamic htmlFile, {required int viewId}) async {
    throw UnimplementedError('createFileUrl');
  }

  /// Release a temporary URL previously created using [createFileUrl()].
  Future<bool> releaseFileUrl(String fileUrl, {required int viewId}) async {
    throw UnimplementedError('releaseFileUrl');
  }

  /// Get the contents of the passed HTML file.
  Future<Uint8List> getFileData(dynamic htmlFile, {required int viewId}) async {
    throw UnimplementedError('getFileData');
  }

  /// Get the contents of the passed HTML file as a chunked stream.
  Stream<List<int>> getFileStream(dynamic htmlFile,
      {required int viewId}) async* {
    throw UnimplementedError('getFileStream');
  }

  /// Event called when the dropzone view has been loaded.
  Stream<DropzoneLoadedEvent> onLoaded({required int viewId}) {
    return events.stream //
        .where(
            (event) => event.viewId == viewId && event is DropzoneLoadedEvent)
        .cast<DropzoneLoadedEvent>();
  }

  /// Event called if the dropzone view has an error.
  Stream<DropzoneErrorEvent> onError({required int viewId}) {
    return events.stream //
        .where((event) => event.viewId == viewId && event is DropzoneErrorEvent)
        .cast<DropzoneErrorEvent>();
  }

  /// Event called when the user hovers over a dropzone.
  Stream<DropzoneHoverEvent> onHover({required int viewId}) {
    return events.stream //
        .where((event) => event.viewId == viewId && event is DropzoneHoverEvent)
        .cast<DropzoneHoverEvent>();
  }

  /// Event called when the user drops a file onto the dropzone.
  Stream<DropzoneDropEvent> onDrop({required int viewId}) {
    return events.stream //
        .where((event) => event.viewId == viewId && event is DropzoneDropEvent)
        .cast<DropzoneDropEvent>();
  }

  /// Event called when the user tries to drop an invalid file onto the dropzone.
  Stream<DropzoneDropInvalidEvent> onDropInvalid({required int viewId}) {
    return events.stream //
        .where((event) =>
    event.viewId == viewId && event is DropzoneDropInvalidEvent)
        .cast<DropzoneDropInvalidEvent>();
  }

  /// Event called when the user drops multiple files onto the dropzone.
  Stream<DropzoneDropMultipleEvent> onDropMultiple({required int viewId}) {
    return events.stream //
        .where((event) =>
    event.viewId == viewId && event is DropzoneDropMultipleEvent)
        .cast<DropzoneDropMultipleEvent>();
  }

  /// Event called when the user leaves a dropzone.
  Stream<DropzoneLeaveEvent> onLeave({required int viewId}) {
    return events.stream //
        .where((event) => event.viewId == viewId && event is DropzoneLeaveEvent)
        .cast<DropzoneLeaveEvent>();
  }

  /// Internal function to build the platform view.
  Widget buildView(
      Map<String, dynamic> creationParams,
      Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
      PlatformViewCreatedCallback onPlatformViewCreated) {
    throw UnimplementedError('buildView');
  }

  void dispose() {
    events.close();
  }
}

class DropzoneEvent<T> {
  final int viewId;
  final T? value;

  DropzoneEvent(this.viewId, [this.value]);
}

/// Event called when the dropzone view has been loaded.
class DropzoneLoadedEvent extends DropzoneEvent {
  DropzoneLoadedEvent(int viewId) : super(viewId, null);
}

/// Event called if the dropzone view has an error.
class DropzoneErrorEvent extends DropzoneEvent<String> {
  DropzoneErrorEvent(int viewId, String error) : super(viewId, error);
}

/// Event called when the user hovers over a dropzone.
class DropzoneHoverEvent extends DropzoneEvent {
  DropzoneHoverEvent(int viewId) : super(viewId, null);
}

/// Event called when the user drops a file onto the dropzone.
class DropzoneDropEvent extends DropzoneEvent<dynamic> {
  DropzoneDropEvent(int viewId, dynamic file) : super(viewId, file);
}

/// Event called when the user tries to drop an invalid file onto the dropzone.
class DropzoneDropInvalidEvent extends DropzoneEvent<dynamic> {
  DropzoneDropInvalidEvent(int viewId, String mime) : super(viewId, mime);
}

/// Event called when the user drops multiple files onto the dropzone.
class DropzoneDropMultipleEvent extends DropzoneEvent<List<dynamic>> {
  DropzoneDropMultipleEvent(int viewId, List<dynamic> files)
      : super(viewId, files);
}

/// Event called when the user leaves a dropzone.
class DropzoneLeaveEvent extends DropzoneEvent {
  DropzoneLeaveEvent(int viewId) : super(viewId, null);
}


 */