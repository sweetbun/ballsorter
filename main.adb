with MaRTE_OS;
with Chute; use Chute;
with Ada.Calendar; use Ada.Calendar;
with Released_Ball; use Released_Ball;

procedure Main is

	Balls : Pro_Ball_List;

	task type Toggler is
		entry Detected;
	end Toggler;

	task body Toggler is
		Start : Time;
	begin
		loop
			accept Detected do
				Start := Clock;
				delay until Start + 0.12;
				Sorter_Glass;
				delay until Start + 0.42;
				Sorter_Metal;
			end Detected;
		end loop;
	end Toggler;

	task Releaser is
	end Releaser;

	task body Releaser is
		i : Integer;
		Start : Time;
	begin
		i := 60;

		while i>0 loop
			Start := Clock;
			i := i-1;
			Hopper_Load;
			delay until Start + 0.25;
			Hopper_Unload;
			Balls.Push(Unknown);
			delay until Start + 0.8;
			
		end loop;
	end Releaser;

task Detector is
end Detector;
task body Detector is
	Start_Time : Time;
	Last_Time : Time;
	Ball : Ball_Detected;
	Previous_Ball : Ball_Detected;

	type Unsigned_1 is mod 2;
	Togglers : array (Unsigned_1) of Toggler;
	
	Index : Unsigned_1 := 0;
begin
	Get_Ball(Ball, Start_Time);
	Get_Ball(Ball, Start_Time);

	-- Start fo real
	Sorter_Metal;
	loop
	Get_Ball(Ball, Start_Time);
	
	if Ball = Metal then
		Balls.AlterTail(Metal);
	else
		Balls.Unqueue(Ball);
		if Ball = Unknown then
			Togglers(Index).Detected;
			Index := Index + 1;
		end if;
	end if;
	
	
	--if Ball = Unknown and Previous_Ball /= Metal then
	--	Sorter_Glass;
	--	delay 0.8;
	--	Sorter_Metal;
	--end if;
	--Previous_Ball := Ball;
	end loop;

end Detector;
begin
null;
end Main;
