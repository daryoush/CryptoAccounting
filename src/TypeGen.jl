module  TypeGen

using JSON3


#################################################
#TODO MAKE SURE THE JSON HAS ONLY A SINGLE [ ]
##################################################
json_string = read("nicki415.json", String)
JSON3.writetypes(json_string, "gen/json_types.jl"; module_name=:CryptoCalcRes, root_name=:CryptoCalcRes, mutable=false)

end  # module  TypeGen

using JSON3

json_string = read("nicki415.json", String)
j3= JSON3.read(json_string)

JSON3.(j3)
