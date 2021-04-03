Makeup.destroy_all


puts "seeding database..."
C_Makeup::Adapter.new.fectch_makeup 
puts "Done"