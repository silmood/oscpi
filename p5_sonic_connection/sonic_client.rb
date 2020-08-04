use_osc_logging true

live_loop :recive do
  use_real_time
  msg = sync "/osc*/p5"
  puts msg
end

live_loop :send do
  use_osc "localhost", 8000
  osc "/sonic"
  sleep 4
end