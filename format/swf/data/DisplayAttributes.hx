package format.swf.data;


import flash.display.DisplayObject;
import flash.filters.BitmapFilter;
import flash.geom.ColorTransform;
import flash.geom.Matrix;


class DisplayAttributes {
	
	
	public var colorTransform:ColorTransform;
	public var filters:Array <BitmapFilter>;
	public var frame:Int;
	public var matrix:Matrix;
	public var name:String;
	public var ratio:Null<Int>;
	public var symbolID:Int;
	
	private static var defaultColorTransform:ColorTransform = new ColorTransform();
	
	public function new () {
		
		
		
	}
	
	
	public function apply (object:DisplayObject) {
		
		if (matrix != null) {
			
			object.transform.matrix = matrix.clone ();
			
		}
		
		if (colorTransform != null) {
			
			object.transform.colorTransform = colorTransform;
			
		}
		else {
			object.transform.colorTransform = defaultColorTransform;
		}
		
		object.name = name;
		
		if ((filters == null && object.filters.length > 0) || (filters != null && object.filters != filters)) {
			
			object.filters = filters;
			
		}
		
		if (ratio != null && Std.is (object, MorphObject)) {
			
			var morph:MorphObject = cast object;
			return morph.setRatio (ratio);
			
		}
		
		return false;
		
	}
	
	
	public function clone ():DisplayAttributes {
		
		var copy = new DisplayAttributes ();
		
		copy.frame = frame;
		copy.matrix = matrix;
		copy.colorTransform = colorTransform;
		copy.ratio = ratio;
		copy.name = name;
		copy.symbolID = symbolID;
		
		return copy;
		
	}
	
	
}