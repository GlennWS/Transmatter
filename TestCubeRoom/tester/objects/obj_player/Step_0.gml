/// Basic Player Movement

/// Arrow Key ///
// Move Right
if (keyboard_check(vk_right)) {
	phy_position_x += 3;
}

// Move Left
if (keyboard_check(vk_left)) {
	phy_position_x -= 3;
}

// Move Up
if (keyboard_check(vk_up)) {
	phy_position_y -= 3;
}

// Move Down
if (keyboard_check(vk_down)) {
	phy_position_y += 3;
}
////////////////////////////////

/// WASD ///
// Move Right
if (keyboard_check(ord("D"))) {
	phy_position_x += 3;
}

// Move Left
if (keyboard_check(ord("A"))) {
	phy_position_x -= 3;
}

// Move Up
if (keyboard_check(ord("W"))) {
	phy_position_y -= 3;
}

// Move Down
if (keyboard_check(ord("S"))) {
	phy_position_y += 3;
}