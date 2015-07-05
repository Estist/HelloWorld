package;


import flixel.util.FlxPoint;
import flixel.FlxCamera;
import flixel.FlxG;


class ZoomScrollCamera extends FlxCamera
{
 public var targetZoom(default,set):Float;
 public var zoomSpeed:Float;


 private var _currentZoomSpeed:Float;
 private var _zoomStartWidth:Int;
 private var _zoomStartHeight:Int;
 private var _startScrollX:Float;
 private var _startScrollY:Float;
 public var _lastMousePos:FlxPoint;


 public function new(X:Int, Y:Int, Width:Int, Height:Int, Zoom:Float = 0)
 {
    super(X, Y, Width, Height, FlxCamera.defaultZoom);

    _currentZoomSpeed = 0;
    x = 0;
    y = 0;
    targetZoom = 1;
    zoom = 1;
    zoomSpeed = 3;
    _lastMousePos = new FlxPoint(0,0);
 }


 public function set_targetZoom(z:Float):Float
 {
    targetZoom = z;
    if (targetZoom < zoom) _currentZoomSpeed = -zoomSpeed;
    if (targetZoom > zoom) _currentZoomSpeed = zoomSpeed;

    _zoomStartWidth = width;
    _zoomStartHeight = height;

    _startScrollX = scroll.x;
    _startScrollY = scroll.y;

    return targetZoom;
 }


 public override function update():Void
 {
    super.update();


    if (FlxG.mouse.justPressed) {
        _lastMousePos.x = FlxG.mouse.screenX;
       _lastMousePos.y = FlxG.mouse.screenY;
    }


    if (FlxG.mouse.pressed) {
       scroll.x -= (FlxG.mouse.screenX - _lastMousePos.x);
       scroll.y -= (FlxG.mouse.screenY - _lastMousePos.y);
       _lastMousePos.x = FlxG.mouse.screenX;
       _lastMousePos.y = FlxG.mouse.screenY;
    }


    if (_currentZoomSpeed != 0)
    {
       zoom += FlxG.elapsed * _currentZoomSpeed;
       width = Std.int(FlxG.width / zoom);
       height = Std.int(FlxG.height / zoom);
       scroll.x = _startScrollX + ((_zoomStartWidth - width)/2);
       scroll.y = _startScrollY + ((_zoomStartHeight - height)/2);

       if (_currentZoomSpeed > 0 && zoom >= targetZoom || _currentZoomSpeed < 0 && zoom <= targetZoom)
          doneZoom();
     }
 }


 private function doneZoom()
 {
    _currentZoomSpeed = 0;
 }


}