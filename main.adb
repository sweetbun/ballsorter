with MaRTE_OS;
with Chute; use Chute;
with Ada.Calendar; use Ada.Calendar;

procedure Main is
   Start_Time : Time;
   Last_Time : Time;
   Ball : Ball_Detected;
begin
   Get_Ball(Ball, Start_Time);
   Get_Ball(Ball, Start_Time);
   loop
      Hopper_Load;
      delay 0.2;
      Hopper_Unload;
      Get_Ball(Ball, Start_Time);
      if Ball = Metal then
	 Sorter_Metal;
	 Get_Ball(Ball, Last_Time);
      else
	 Sorter_Glass;
      end if;
--      Get_Ball(Ball, Last_Time);
   end loop;
   --   Get_Ball(Last_Ball, Last_Time);
end Main;
