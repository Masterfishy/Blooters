package source;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyboard;
import flixel.FlxG;
import flixel.input.FlxInputState;

/**
 * ...
 * @author Nicholas Christensen
 */
enum MovementState
{
	p1Up;
	p1Down;
	p1Right;
	p1Left;
	p2Up;
	p2Down;
	p2Right;
	p2Left;
}
class InputManager
{
	/**
	 * Maps out a keys and movements
	 */
	private var _inputMap:Map<FlxKey, MovementState>;

	public function new() 
	{
		_inputMap = [
			FlxKey.UP    => p2Up,
			FlxKey.DOWN  => p2Down,
			FlxKey.RIGHT => p2Right,
			FlxKey.LEFT  => p2Left,
			FlxKey.W	 => p1Up,
			FlxKey.S     => p1Down,
			FlxKey.D     => p1Right,
			FlxKey.A     => p1Left
		];
	}
	public function processInput():Void
	{
		for (key in _inputMap.keys())
		{
			if (FlxG.keys.checkStatus(key, FlxInputState.PRESSED)
				//TODO: place key logic depending on the input state, we can access what movement state should be toggled with _inputMap[key]
				
		}
	}
	
	/**
	 * changes map so that the newKey is assigned to newMovementState and removes any instances of the old movement state
	 * @param	newKey 
	 * @param	newMovementState this state will be assigned to the key
	 */
	public function changeKey(newKey:FlxKey,newMovementState:MovementState):Void
	{
		for (key in _inputMap.keys())
		{
			if (_inputMap[key] == newMovementState)
			{
				_inputMap.remove(key)
			}
		}
		//is placed after removal so that it isn't removed with the original key
		_inputMap[newKey] = newMovementState;
	}
	
	/**
	 * Get's key assigned to movement state
	 * @param	movementState
	 * @return returns key assigned to movementState
	 */
	public function getKey(movementState:MovementState):FlxKey
	{
		for (value in _inputMap)
		{
			if (value == movementState)
			{
				return value;
			}
		}
	}
	
}