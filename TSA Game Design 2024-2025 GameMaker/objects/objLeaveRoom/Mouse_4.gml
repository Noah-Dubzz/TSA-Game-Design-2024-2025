/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 22D228B1
var l22D228B1_0;l22D228B1_0 = keyboard_check_pressed(vk_space);if (l22D228B1_0){	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 7A86184A
	/// @DnDParent : 22D228B1
	/// @DnDArgument : "room" "rmTitleScreen"
	/// @DnDSaveInfo : "room" "rmTitleScreen"
	room_goto(rmTitleScreen);}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Mouse_Pressed
/// @DnDVersion : 1.1
/// @DnDHash : 5E4CA8F5
var l5E4CA8F5_0;l5E4CA8F5_0 = mouse_check_button_pressed(mb_left);if (l5E4CA8F5_0){	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 6A685145
	/// @DnDParent : 5E4CA8F5
	/// @DnDArgument : "room" "rmTitleScreen"
	/// @DnDSaveInfo : "room" "rmTitleScreen"
	room_goto(rmTitleScreen);}