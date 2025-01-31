/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Mouse_Pressed
/// @DnDVersion : 1.1
/// @DnDHash : 0691D67E
var l0691D67E_0;l0691D67E_0 = mouse_check_button_pressed(mb_left);if (l0691D67E_0){	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 2E21823E
	/// @DnDParent : 0691D67E
	/// @DnDArgument : "room" "rmTitleScreen"
	/// @DnDSaveInfo : "room" "rmTitleScreen"
	room_goto(rmTitleScreen);}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 0AD3C8D8
/// @DnDArgument : "key" "vk_escape"
var l0AD3C8D8_0;l0AD3C8D8_0 = keyboard_check_pressed(vk_escape);if (l0AD3C8D8_0){	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 5A1C0C07
	/// @DnDParent : 0AD3C8D8
	/// @DnDArgument : "room" "rmTitleScreen"
	/// @DnDSaveInfo : "room" "rmTitleScreen"
	room_goto(rmTitleScreen);}