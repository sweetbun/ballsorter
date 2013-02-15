with MaRTE_OS;
with Chute; use Chute;

package Released_Ball is

	type Ball is private;
	type Ball_Access is access Ball;
	
	protected type Pro_Ball_List is
		entry Push (Item : Ball_Detected);
		entry Pop (Item : out Ball_Detected);

		entry Queue (Item : Ball_Detected);
		entry Unqueue (Item : out Ball_Detected);

		entry AlterHead (Item : Ball_Detected);
		entry AlterTail (Item : Ball_Detected);

		entry AlterNHead (Item : Ball_Detected; N : Natural);
		entry AlterNTail (Item : Ball_Detected; N : Natural);

	private
		Head : Ball_Access;
		Tail : Ball_Access;
	end Pro_Ball_List;
	
	Null_Error : exception;
	
private

	type Ball is record
		Next : Ball_Access := null;
		Item : Ball_Detected;
		Prev : Ball_Access := null;
	end record;

end Released_Ball;