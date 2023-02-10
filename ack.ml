let rec ack m n = match m, n with
  | 0, _ -> n + 1
  | _, 0 -> ack (m - 1) 1
  | _, _ -> ack (m - 1) (ack m (n - 1))
;;

let main() =
  let argc = Array.length Sys.argv in
  if argc < 3 then
    begin
      Printf.printf "Usage: %s m n\n" Sys.argv.(0);
    end
  else
  if argc > 3 then
    begin
      Printf.printf "%s: Too many arguments\n" Sys.argv.(0);
    end
  else
    begin
      try
        let m = int_of_string Sys.argv.(1) in
        let n = int_of_string Sys.argv.(2) in
        if m < 0 || n < 0 then
          begin
            Printf.printf "%s: Invalid arguments\n" Sys.argv.(0);
          end
        else
          begin
            Printf.printf "Ackermann(%d, %d) = %d\n" m n (ack m n)
          end
      with
        Failure _ -> Printf.printf "%s: Invalid arguments\n" Sys.argv.(0)
    end
;;

main();;