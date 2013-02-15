with MaRTE_OS;
with Chute; use Chute;

package body Released_Ball is

	protected body Pro_Ball_List is
		
		entry Push (Item : Ball_Detected)
			when True is
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

		entry Pop (Item : out Ball_Detected)
			when Head /= null is
		begin
			Item := Tail.Item;
			Tail := Tail.Prev;
			Tail.Next := null;
		end Pop;

		entry Queue (Item : Ball_Detected)
			when True is
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
		end Queue;

		entry Unqueue (Item : out Ball_Detected)
			when Head /= null is
		begin
			Item := Head.Item;
			Head := Head.Next;
			Tail.Prev := null;
		end Unqueue;

		entry AlterHead (Item : Ball_Detected)
			when Head /= null is
		begin
			Head.Item := Item;
		end AlterHead;

		entry AlterTail (Item : Ball_Detected)
			when Tail /= null is
		begin
			Tail.Item := Item;
		end AlterTail;

		entry AlterNHead (Item : Ball_Detected; N : Natural)
			when Head /= null is
			tmp : Ball_Access;
			tmpN : Natural := N;
		begin
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

		entry AlterNTail (Item : Ball_Detected; N : Natural)
			when Tail /= null is
			tmp : Ball_Access;
			tmpN : Natural := N;
		begin
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