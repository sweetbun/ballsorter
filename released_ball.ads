with MaRTE_OS;
with Chute; use Chute;

package Released_Ball is
	type Ball_List is limited private;
	
	Empty_Error : exception;
	Null_Error : exception;
	
	procedure Push (Item : Ball_Detected; To : in out Ball_List);
	procedure Pop (Item : out Ball_Detected; From : in out Ball_List);
	
	procedure Unshift (Item : Ball_Detected; To : in out Ball_List);
	procedure Shift (Item : out Ball_Detected; From : in out Ball_List);
	
	procedure AlterHead (Item : Ball_Detected; From : in out Ball_List);
	procedure AlterTail (Item : Ball_Detected; From : in out Ball_List);

	procedure AlterNHead (Item : Ball_Detected; N : Natural; From : in out Ball_List);
	procedure AlterNTail (Item : Ball_Detected; N : Natural; From : in out Ball_List);
	
private
	type Ball;
	type Ball_Access is access Ball;
	
	type Ball is record
		Next : Ball_Access := null;
		Item : Ball_Detected;
		Prev : Ball_Access := null;
	end record;
	
	type Ball_List is record
		Head : Ball_Access;
		Tail : Ball_Access;
	end record;
end Released_Ball;