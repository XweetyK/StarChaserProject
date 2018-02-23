package;

import entities.Flecha;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;


class PlayState extends FlxState
{
	private var texty:FlxText;
	private var upBar1:FlxSprite;
	private var upBar2:FlxSprite;
	private var upBar3:FlxSprite;
	private var upBarD:FlxSprite;
	private var rightBar1:FlxSprite;
	private var rightBar2:FlxSprite;
	private var rightBar3:FlxSprite;
	private var rightBarD:FlxSprite;
	private var downBar1:FlxSprite;
	private var downBar2:FlxSprite;
	private var downBar3:FlxSprite;
	private var downBarD:FlxSprite;
	private var leftBar1:FlxSprite;
	private var leftBar2:FlxSprite;
	private var leftBar3:FlxSprite;
	private var leftBarD:FlxSprite;
	private var score:Int;
	private var arrow:FlxTypedGroup<Flecha>;
	private var ratio:FlxText;
	private var timeTimed:Int;
	private var timer:Int;
	private var r:FlxRandom;
	private var flecha:Flecha;
	private var wFlecha:Int;
	private var comboTxt:FlxText;
	private var combo:Int;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.camera.bgColor = 0xFF0A0A2A;
		
		texty = new FlxText(50, 50, 0, "", 24);
		score = 0;
		ratio = new FlxText(50, 75, 0, "", 24);
		comboTxt = new FlxText(50, 100, 0, "", 24);
		combo = 0;
		
		upBar1 = new FlxSprite(700, 50);
		upBar1.makeGraphic(450, 1);
		upBar1.immovable = true;
		upBar2 = new FlxSprite(700, 58);
		upBar2.makeGraphic(450, 3);
		upBar2.immovable = true;
		upBar3 = new FlxSprite(700, 69);
		upBar3.makeGraphic(450, 1);
		upBar3.immovable = true;
		upBarD = new FlxSprite(700, 10);
		upBarD.makeGraphic(450, 1);
		upBarD.immovable = true;
		
		rightBar1 = new FlxSprite(1130, 50);
		rightBar1.makeGraphic(1, 420);
		rightBar1.immovable = true;
		rightBar2 = new FlxSprite(1138, 50);
		rightBar2.makeGraphic(3, 420);
		rightBar2.immovable = true;
		rightBar3 = new FlxSprite(1149, 50);
		rightBar3.makeGraphic(1, 420);
		rightBar3.immovable = true;
		rightBarD = new FlxSprite(1190, 50);
		rightBarD.makeGraphic(1, 420);
		rightBarD.immovable = true;
		
		downBar1 = new FlxSprite(50, 550);
		downBar1.makeGraphic(450, 1);
		downBar1.immovable = true;
		downBar2 = new FlxSprite(50, 558);
		downBar2.makeGraphic(450, 3);
		downBar2.immovable = true;
		downBar3 = new FlxSprite(50, 569);
		downBar3.makeGraphic(450, 1);
		downBar3.immovable = true;
		downBarD = new FlxSprite(50, 610);
		downBarD.makeGraphic(450, 1);
		downBarD.immovable = true;
		
		leftBar1 = new FlxSprite(50, 150);
		leftBar1.makeGraphic(1, 420);
		leftBar1.immovable = true;
		leftBar2 = new FlxSprite(58, 150);
		leftBar2.makeGraphic(3, 420);
		leftBar2.immovable = true;
		leftBar3 = new FlxSprite(69, 150);
		leftBar3.makeGraphic(1, 420);
		leftBar3.immovable = true;
		leftBarD = new FlxSprite(10, 150);
		leftBarD.makeGraphic(1, 420);
		leftBarD.immovable = true;
		
		arrow = new FlxTypedGroup();
		
		timer = 100;
		timeTimed = 0;
		wFlecha = 0;
		r = new FlxRandom();
		
		add(texty); 
		add(ratio);
		add(comboTxt);
		add(leftBar1);
		add(leftBar2);
		add(leftBar3);
		add(leftBarD);
		add(downBar1);
		add(downBar2);
		add(downBar3);
		add(downBarD);
		add(rightBar1);
		add(rightBar2);
		add(rightBar3);
		add(rightBarD);
		add(upBar1);
		add(upBar2);
		add(upBar3);
		add(upBarD);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		texty.text = "score: " + score;
		comboTxt.text = "Combo: " + combo;
		leftBar1.color = FlxColor.WHITE;
		leftBar2.color = FlxColor.WHITE;
		leftBar3.color = FlxColor.WHITE;
		downBar1.color = FlxColor.WHITE;
		downBar2.color = FlxColor.WHITE;
		downBar3.color = FlxColor.WHITE;
		upBar1.color = FlxColor.WHITE;
		upBar2.color = FlxColor.WHITE;
		upBar3.color = FlxColor.WHITE;
		rightBar1.color = FlxColor.WHITE;
		rightBar2.color = FlxColor.WHITE;
		rightBar3.color = FlxColor.WHITE;
		arrowCreator();
		arrowMech();
		trace(arrow.members.length);
		
	}
	private function arrowMech ()
	{
		//COLOR--------------------------------------------------
		if (FlxG.keys.pressed.LEFT||FlxG.keys.pressed.A)
		{
			leftBar1.color = FlxColor.CYAN;
			leftBar2.color = FlxColor.CYAN;
			leftBar3.color = FlxColor.CYAN;
		}
		if (FlxG.keys.pressed.DOWN||FlxG.keys.pressed.S)
		{
			downBar1.color = FlxColor.CYAN;
			downBar2.color = FlxColor.CYAN;
			downBar3.color = FlxColor.CYAN;
		}
		if (FlxG.keys.pressed.UP||FlxG.keys.pressed.W)
		{
			upBar1.color = FlxColor.MAGENTA;
			upBar2.color = FlxColor.MAGENTA;
			upBar3.color = FlxColor.MAGENTA;
		}
		if (FlxG.keys.pressed.RIGHT||FlxG.keys.pressed.D)
		{
			rightBar1.color = FlxColor.MAGENTA;
			rightBar2.color = FlxColor.MAGENTA;
			rightBar3.color = FlxColor.MAGENTA;
		}
		//ACCURACY-------------------------------------------------------------------------------------
		//LEFT-----------------------------------------------------------------------------------------
		for (i in 0... arrow.members.length)
		{
			if (FlxG.overlap(arrow.members[i], leftBar1) && FlxG.keys.justPressed.LEFT)
			{
				if (FlxG.overlap(arrow.members[i], leftBar2) && FlxG.keys.justPressed.LEFT)
				{
					if (FlxG.overlap(arrow.members[i], leftBar3) && FlxG.keys.justPressed.LEFT)
					{
						ratio.text = "Perfect";
						score += 500;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
					else
					{
						ratio.text = "Good";
						score += 200;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			if (FlxG.overlap(arrow.members[i], leftBar3) && FlxG.keys.justPressed.LEFT)
			{
				if (FlxG.overlap(arrow.members[i], leftBar2) && FlxG.keys.justPressed.LEFT)
				{
					ratio.text = "Good";
					score += 200;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			//DOWN-----------------------------------------------------------------------------------------
			if (FlxG.overlap(arrow.members[i], downBar1) && FlxG.keys.justPressed.DOWN)
			{
				if (FlxG.overlap(arrow.members[i], downBar2) && FlxG.keys.justPressed.DOWN)
				{
					if (FlxG.overlap(arrow.members[i], downBar3) && FlxG.keys.justPressed.DOWN)
					{
						ratio.text = "Perfect";
						score += 500;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
					else
					{
						ratio.text = "Good";
						score += 200;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			if (FlxG.overlap(arrow.members[i], downBar3) && FlxG.keys.justPressed.DOWN)
			{
				if (FlxG.overlap(arrow.members[i], downBar2) && FlxG.keys.justPressed.DOWN)
				{
					ratio.text = "Good";
					score += 200;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			//UP-------------------------------------------------------------------------------------------
			if (FlxG.overlap(arrow.members[i], upBar1) && FlxG.keys.justPressed.UP)
			{
				if (FlxG.overlap(arrow.members[i], upBar2) && FlxG.keys.justPressed.UP)
				{
					if (FlxG.overlap(arrow.members[i], upBar3) && FlxG.keys.justPressed.UP)
					{
						ratio.text = "Perfect";
						score += 500;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
					else
					{
						ratio.text = "Good";
						score += 200;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			if (FlxG.overlap(arrow.members[i], upBar3) && FlxG.keys.justPressed.UP)
			{
				if (FlxG.overlap(arrow.members[i], upBar2) && FlxG.keys.justPressed.UP)
				{
					ratio.text = "Good";
					score += 200;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			//RIGHT----------------------------------------------------------------------------------------
			if (FlxG.overlap(arrow.members[i], rightBar1) && FlxG.keys.justPressed.RIGHT)
			{
				if (FlxG.overlap(arrow.members[i], rightBar2) && FlxG.keys.justPressed.RIGHT)
				{
					if (FlxG.overlap(arrow.members[i], rightBar3) && FlxG.keys.justPressed.RIGHT)
					{
						ratio.text = "Perfect";
						score += 500;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
					else
					{
						ratio.text = "Good";
						score += 200;
						arrow.remove(arrow.members[i], true);
						combo += 1;
					}
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			if (FlxG.overlap(arrow.members[i], rightBar3) && FlxG.keys.justPressed.RIGHT)
			{
				if (FlxG.overlap(arrow.members[i], rightBar2) && FlxG.keys.justPressed.RIGHT)
				{
					ratio.text = "Good";
					score += 200;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
				else
				{
					ratio.text = "Bad";
					score += 100;
					arrow.remove(arrow.members[i], true);
					combo += 1;
				}
			}
			//MISS-----------------------------------------------------------------------------------------
			if (FlxG.overlap(arrow.members[i],rightBarD)||FlxG.overlap(arrow.members[i],upBarD) ||FlxG.overlap(arrow.members[i],leftBarD)||FlxG.overlap(arrow.members[i],downBarD))
			{
				arrow.remove(arrow.members[i], true);
				ratio.text = "Miss";
				combo = 0;
			}
		}
	}
	private function arrowCreator()
	{
		timeTimed++;
		if (timeTimed >= timer)
		{
			wFlecha = r.int(0, 3);
			flecha = new Flecha(wFlecha);
			arrow.add(flecha);
			add(arrow);
			timeTimed = 0;
		}
	}
}