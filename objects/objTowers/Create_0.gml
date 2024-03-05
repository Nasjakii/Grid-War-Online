
tower_list = ds_list_create();

function tower(_name, _spr, _obj, _price, _overlay, _upgrades) constructor {
	self.name = _name;
	self.object = _obj;
	self.sprite = _spr;
	self.price = _price;
	self.upgrades = _upgrades;
	self.overlay = _overlay;
}
function upgrade(_level, _variable, _value, _price) constructor {
	self.level = _level;
	self.variable = _variable;
	self.value = _value;
	self.price = _price;
}


#region Base
	var base_upgrades = [];

	base_upgrades[0] = new upgrade(0, "hp_max", 20, 20);
	base_upgrades[1] = new upgrade(1, "hp_max", 30, 40);
	base_upgrades[2] = new upgrade(2, "hp_max", 40, 80);
	base_upgrades[3] = new upgrade(3, "hp_max", 50, 160);
	base_upgrades[4] = new upgrade(4, "vision_range", 4, 320);
	
	ds_list_add(tower_list, new tower("Base", sprBase, objBase, 1000, "Upgrade", base_upgrades));
#endregion

#region Collector
	var collector_upgrades = [];
	

	collector_upgrades[0] = new upgrade(0, "money_per_field", 0.25, 20);
	collector_upgrades[1] = new upgrade(1, "money_per_field", 0.5, 40);
	collector_upgrades[2] = new upgrade(2, "money_per_field", 0.9, 80);
	collector_upgrades[3] = new upgrade(3, "money_per_field", 1.5, 160);
	collector_upgrades[4] = new upgrade(4, "vision_range", 2, 640);
	
	ds_list_add(tower_list, new tower("Collector", sprCollector, objCollector, 0, "Upgrade", collector_upgrades));
#endregion

#region Cannon
	
	var cannon_upgrades = [];

	cannon_upgrades[0] = new upgrade(0, "bullet_damage", 2, 40);
	cannon_upgrades[1] = new upgrade(1, "bullet_damage", 4, 80);
	cannon_upgrades[2] = new upgrade(2, "bullet_speed", 2, 160);
	cannon_upgrades[3] = new upgrade(3, "bullet_speed", 5, 320);
	cannon_upgrades[4] = new upgrade(4, "bullet_damage", 16, 640);
	
	ds_list_add(tower_list, new tower("Cannon", sprCannon, objCannon, 30, "Cannon", cannon_upgrades));
#endregion

#region Radar
	var radar_upgrades = [];

	radar_upgrades[0] = new upgrade(0, "vision_range", 4, 40);
	radar_upgrades[1] = new upgrade(1, "vision_range", 5, 80);
	radar_upgrades[2] = new upgrade(2, "vision_range", 6, 160);
	radar_upgrades[3] = new upgrade(3, "vision_range", 7, 320);
	radar_upgrades[4] = new upgrade(4, "vision_range", 9, 640);
	
	ds_list_add(tower_list, new tower("Radar", sprRadar, objRadar, 30, "Upgrade", radar_upgrades));
#endregion

#region Doc
	var doc_upgrades = [];

	doc_upgrades[0] = new upgrade(0, "repair_amount", 2, 40);
	doc_upgrades[1] = new upgrade(1, "repair_amount", 4, 80);
	doc_upgrades[2] = new upgrade(2, "vision_range", 2, 160);
	doc_upgrades[3] = new upgrade(3, "repair_amount", 8, 320);
	doc_upgrades[4] = new upgrade(4, "vision_range", 3, 640);
	
	ds_list_add(tower_list, new tower("Doc", sprDoc, objDoc, 10, "Upgrade", doc_upgrades));
#endregion

#region Striker
	var striker_upgrades = [];

	striker_upgrades[0] = new upgrade(0, "reload_time", 3, 2000);
	striker_upgrades[1] = new upgrade(1, "missile_damage", 20, 2000);
	striker_upgrades[2] = new upgrade(2, "reload_time", 2, 4000);
	striker_upgrades[3] = new upgrade(3, "missile_damage", 40, 6000);
	striker_upgrades[4] = new upgrade(4, "missile_aoe", 3, 15000);
	
	ds_list_add(tower_list, new tower("Striker", sprStriker, objStriker, 2000, "Striker", striker_upgrades));
#endregion

#region Wall
	var wall_upgrades = [];

	wall_upgrades[0] = new upgrade(0, "reload_time", 3, 20);
	wall_upgrades[1] = new upgrade(1, "missile_damage", 20, 40);
	wall_upgrades[2] = new upgrade(2, "reload_time", 2, 160);
	wall_upgrades[3] = new upgrade(3, "missile_damage", 40, 320);
	wall_upgrades[4] = new upgrade(4, "missile_aoe", 3, 640);
	
	ds_list_add(tower_list, new tower("Wall", sprWall, objWall, 5, "Upgrade", wall_upgrades));
#endregion

#region Banger
	var banger_upgrades = [];

	banger_upgrades[0] = new upgrade(0, "bullet_damage", 2, 100);
	banger_upgrades[1] = new upgrade(1, "shrapnel_damage", 5, 200);
	banger_upgrades[2] = new upgrade(2, "shrapnel_damage", 10, 300);
	banger_upgrades[3] = new upgrade(3, "bullet_damage", 5, 400);
	banger_upgrades[4] = new upgrade(4, "bullet_damage", 10, 600);
	
	ds_list_add(tower_list, new tower("Banger", sprBanger, objBanger, 50, "Banger", banger_upgrades));
#endregion

