let rec ack m n print = match m, n with
  | 0, _ -> (n + 1)
  | _, 0 -> begin
    if print then
      begin
        Printf.printf "Inner call: Ackermann(%d, %d)\n" (m - 1) 1;
      end;
    ack (m - 1) 1 print;
  end
  | _, _ -> begin
    if print then
    begin
      Printf.printf "Inner call: Ackermann(%d, Ackermann(%d, %d))\n" (m - 1) m (n - 1);
    end;
    ack (m - 1) (ack m (n - 1) print) print
    end
;;

let main() =
  let argc = Array.length Sys.argv in
  if argc < 3 then
    begin
      Printf.printf "Usage: %s [--print|-p] m n\n" Sys.argv.(0);
    end
  else
  if argc > 4 then
    begin
      Printf.printf "%s: Too many arguments\n" Sys.argv.(0);
    end
  else
    if argc = 3 then
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
              Printf.printf "Ackermann(%d, %d) = %d\n" m n (ack m n false)
            end
        with
          Failure _ -> Printf.printf "%s: Invalid arguments\n" Sys.argv.(0)
      end
    else
      begin
        if Sys.argv.(1) = "--print" || Sys.argv.(1) = "-p" then
          begin
            try
              let m = int_of_string Sys.argv.(2) in
              let n = int_of_string Sys.argv.(3) in
              if m < 0 || n < 0 then
                begin
                  Printf.printf "%s: Invalid arguments\n" Sys.argv.(0);
                end
              else
                begin
                  Printf.printf "Ackermann(%d, %d) = %d\n" m n (ack m n true)
                end
            with
              Failure _ -> Printf.printf "%s: Invalid arguments\n" Sys.argv.(0)
          end
        else
          begin
            Printf.printf "%s: Invalid arguments\n" Sys.argv.(0);
            Printf.printf "Usage: %s [--print|-p] m n\n" Sys.argv.(0);
            Printf.printf "Options must be used as first argument\n";
          end
      end
;;

main();;
exit(0);;