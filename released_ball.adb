with MaRTE_OS;
with Chute; use Chute;

package body Released_Ball is

	protected body Pro_Ball_List is
		
		entry Push (Item : Ball_Detected) is
			tmp : Ball_Access := new Ball;
		begin
			tmp.Item := Item;
			if Head = null then
				Head := tmp;
				Tail := tmp;
			else
				tmp.Prev := Tail;
				Tail.Next := tmp;
				Tail := tmp;
			end if;
		end Push;

		entry Pop (Item : out Ball_Detected) is
		begin
			if Head = null then
				raise Empty_Error;
			end if;
			Item := Tail.Item;
			Tail := Tail.Prev;
			Tail.Next := null;
		end Pop;

		entry Queue (Item : Ball_Detected) is
			tmp : Ball_Access := new Ball;
		begin
			tmp.Item := Item;
			if Head = null then
				Head := tmp;
				Tail := tmp;
			else
				tmp.Next := Head;
				Head.Prev:= tmp;
				Head := tmp;
			end if;
		end Unshift;

		entry Unqueue (Item : out Ball_Detected) is
		begin
			if Head = null then
				raise Empty_Error;
			end if;
			Item := Head.Item;
			Head := Head.Next;
			Tail.Prev := null;
		end Shift;

		entry AlterHead (Item : Ball_Detected) is
		begin
			if Head = null then
				raise Empty_Error;
			end if;
			Head.Item := Item;
		end AlterHead;

		entry AlterTail (Item : Ball_Detected) is
		begin
			if Tail = null then
				raise Empty_Error;
			end if;
			Tail.Item := Item;
		end AlterTail;

		entry AlterNHead (Item : Ball_Detected; N : Natural) is
			tmp : Ball_Access;
			tmpN : Natural := N;
		begin
			if Head = null then
				raise Empty_Error;
			end if;

			tmp := Head;

			while tmpN > 0 loop
				if tmp.Next = Null then
					raise Null_Error;
				end if;
				tmp := tmp.Next;
				tmpN:=tmpN-1;
			end loop;

			tmp.Item := Item;
		end AlterNHead;

		entry AlterNTail (Item : Ball_Detected; N : Natural) is
			tmp : Ball_Access;
			tmpN : Natural := N;
		begin
			if Tail = null then
				raise Empty_Error;
			end if;

			tmp := Tail;

			while tmpN > 0 loop
				if tmp.Prev = Null then
					raise Null_Error;
				end if;
				tmp := tmp.Prev;
				tmpN:=tmpN-1;
			end loop;

			tmp.Item := Item;
		end AlterNTail;
		
	end Pro_Ball_List;
	
end Released_Ball;