
tower_list = ds_list_create();

function tower(_name, _spr, _obj, _price, _description, _overlay, _upgrades) constructor {
	self.name = _name;
	self.object = _obj;
	self.sprite = _spr;
	self.price = _price;
	self.description = _description;
	self.overlay = _overlay;
	self.upgrades = _upgrades;
	
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
	
	var text = "The center of your operation, in Base-Mode you lose when all your Bases are destroyed";
	
	ds_list_add(tower_list, new tower("Base", sprBase, objBase, 1000, text, "Upgrade", base_upgrades));
#endregion

#region Collector
	var collector_upgrades = [];
	

	collector_upgrades[0] = new upgrade(0, "money_per_field", 0.25, 20);
	collector_upgrades[1] = new upgrade(1, "money_per_field", 0.5, 40);
	collector_upgrades[2] = new upgrade(2, "money_per_field", 0.9, 80);
	collector_upgrades[3] = new upgrade(3, "money_per_field", 1.5, 160);
	collector_upgrades[4] = new upgrade(4, "vision_range", 2, 640);
	
	var text = "Collects money for every empty tile in its vision range";
	
	ds_list_add(tower_list, new tower("Collector", sprCollector, objCollector, 0, text, "Upgrade", collector_upgrades));
#endregion

#region Cannon
	
	var cannon_upgrades = [];

	cannon_upgrades[0] = new upgrade(0, "bullet_damage", 2, 40);
	cannon_upgrades[1] = new upgrade(1, "bullet_damage", 4, 80);
	cannon_upgrades[2] = new upgrade(2, "bullet_speed", 2, 160);
	cannon_upgrades[3] = new upgrade(3, "bullet_speed", 5, 320);
	cannon_upgrades[4] = new upgrade(4, "bullet_damage", 16, 640);
	
	var text = "Shoots light bullets in the direction you specify it to";
	
	ds_list_add(tower_list, new tower("Cannon", sprCannon, objCannon, 30, text, "Cannon", cannon_upgrades));
#endregion

#region Radar
	var radar_upgrades = [];

	radar_upgrades[0] = new upgrade(0, "vision_range", 4, 40);
	radar_upgrades[1] = new upgrade(1, "vision_range", 5, 80);
	radar_upgrades[2] = new upgrade(2, "vision_range", 6, 160);
	radar_upgrades[3] = new upgrade(3, "vision_range", 7, 320);
	radar_upgrades[4] = new upgrade(4, "vision_range", 9, 640);
	
	var text = "A Tower with a huge vision range";
	
	ds_list_add(tower_list, new tower("Radar", sprRadar, objRadar, 30, text, "Upgrade", radar_upgrades));
#endregion

#region Doc
	var doc_upgrades = [];

	doc_upgrades[0] = new upgrade(0, "repair_amount", 2, 40);
	doc_upgrades[1] = new upgrade(1, "repair_amount", 4, 80);
	doc_upgrades[2] = new upgrade(2, "vision_range", 2, 160);
	doc_upgrades[3] = new upgrade(3, "repair_amount", 8, 320);
	doc_upgrades[4] = new upgrade(4, "vision_range", 3, 640);
	
	var text = "Refills health of allied towers in range";
	
	ds_list_add(tower_list, new tower("Doc", sprDoc, objDoc, 10, text, "Upgrade", doc_upgrades));
#endregion

#region Striker
	var striker_upgrades = [];

	striker_upgrades[0] = new upgrade(0, "reload_time", 3, 2000);
	striker_upgrades[1] = new upgrade(1, "missile_damage", 20, 2000);
	striker_upgrades[2] = new upgrade(2, "reload_time", 2, 4000);
	striker_upgrades[3] = new upgrade(3, "missile_damage", 40, 6000);
	striker_upgrades[4] = new upgrade(4, "missile_aoe", 3, 15000);
	
	var text = "A powerful tower with infinite range, select the target and it wont miss";
	
	ds_list_add(tower_list, new tower("Striker", sprStriker, objStriker, 2000, text, "Striker", striker_upgrades));
#endregion

#region Wall
	var wall_upgrades = [];

	wall_upgrades[0] = new upgrade(0, "reload_time", 3, 20);
	wall_upgrades[1] = new upgrade(1, "missile_damage", 20, 40);
	wall_upgrades[2] = new upgrade(2, "reload_time", 2, 160);
	wall_upgrades[3] = new upgrade(3, "missile_damage", 40, 320);
	wall_upgrades[4] = new upgrade(4, "missile_aoe", 3, 640);
	
	var text = "Blocking enemy bullets and letting through allied bullets";
	
	ds_list_add(tower_list, new tower("Wall", sprWall, objWall, 5, text, "Upgrade", wall_upgrades));
#endregion

#region Banger
	var banger_upgrades = [];

	banger_upgrades[0] = new upgrade(0, "bullet_damage", 2, 100);
	banger_upgrades[1] = new upgrade(1, "shrapnel_damage", 5, 200);
	banger_upgrades[2] = new upgrade(2, "shrapnel_damage", 10, 300);
	banger_upgrades[3] = new upgrade(3, "bullet_damage", 5, 400);
	banger_upgrades[4] = new upgrade(4, "bullet_damage", 10, 600);
	
	var text = "Powerful bullets that smash trough walls and hit the Towers directly behind it";
	
	ds_list_add(tower_list, new tower("Banger", sprBanger, objBanger, 50, text, "Banger", banger_upgrades));
#endregion

