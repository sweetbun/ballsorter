with MaRTE_OS;
with Chute; use Chute;

package body Released_Ball is
	procedure Push (Item : Ball_Detected; To : in out Ball_List) is
		tmp : Ball_Access := new Ball;
	begin
		tmp.Item := Item;
		if To.Head = null then
			To.Head := tmp;
			To.Tail := tmp;
		else
			tmp.Prev := To.Tail;
			To.Tail.Next := tmp;
			To.Tail := tmp;
		end if;
	end Push;
	
	procedure Pop (Item : out Ball_Detected; From : in out Ball_List) is
	begin
		if From.Head = null then
			raise Empty_Error;
		end if;
		Item := From.Tail.Item;
		From.Tail := From.Tail.Prev;
		From.Tail.Next := null;
	end Pop;

	procedure Unshift (Item : Ball_Detected; To : in out Ball_List) is
		tmp : Ball_Access := new Ball;
	begin
		tmp.Item := Item;
		if To.Head = null then
			To.Head := tmp;
			To.Tail := tmp;
		else
			tmp.Next := To.Head;
			To.Head.Prev:= tmp;
			To.Head := tmp;
		end if;
	end Unshift;
		
	procedure Shift (Item : out Ball_Detected; From : in out Ball_List) is
	begin
		if From.Head = null then
			raise Empty_Error;
		end if;
		Item := From.Head.Item;
		From.Head := From.Head.Next;
		From.Tail.Prev := null;
	end Shift;

	procedure AlterHead (Item : Ball_Detected; From : in out Ball_List) is
	begin
		if From.Head = null then
			raise Empty_Error;
		end if;
		From.Head.Item := Item;
	end AlterHead;
	
	procedure AlterTail (Item : Ball_Detected; From : in out Ball_List) is
	begin
		if From.Tail = null then
			raise Empty_Error;
		end if;
		From.Tail.Item := Item;
	end AlterTail;

	procedure AlterNHead (Item : Ball_Detected; N : Natural; From : in out Ball_List) is
		tmp : Ball_Access;
		tmpN : Natural := N;
	begin
		if From.Head = null then
			raise Empty_Error;
		end if;
		
		tmp := From.Head;

		while tmpN > 0 loop
			if tmp.Next = Null then
				raise Null_Error;
			end if;
			tmp := tmp.Next;
			tmpN:=tmpN-1;
		end loop;
		
		tmp.Item := Item;
	end AlterNHead;

	procedure AlterNTail (Item : Ball_Detected; N : Natural; From : in out Ball_List) is
		tmp : Ball_Access;
		tmpN : Natural := N;
	begin
		if From.Tail = null then
			raise Empty_Error;
		end if;

		tmp := From.Tail;

		while tmpN > 0 loop
			if tmp.Prev = Null then
				raise Null_Error;
			end if;
			tmp := tmp.Prev;
			tmpN:=tmpN-1;
		end loop;
		
		tmp.Item := Item;
	end AlterNTail;
	
end Released_Ball;