module CryptoAccounting
## %
using JSON3
using Dates
using DataFrames
using Chain
using Plots
module types include("api_json_types.jl") end

default_fiat = "e2a4afac-92c6-11e9-a5ee-0a290192900c"

json_string = read("nicki415.json", String)
res = JSON3.read(json_string, types.CryptoCalcResults, dateformat=Dates.DateFormat("yyyy-mm-ddTHH:MM:SSzzzzz"))
transactions = [r.transaction for r in res.results]

## %

#   --------------------------------------  ALGEBRA SECTION
flip(f)= (x,y)-> f(y,x)
ff=flip(filter)

toList(x::Array) =  x 
toList(x::Nothing) = [] # rename this... point is to turn nothing to []
                                   # can this be written so the [] is just default const of type?

uuid_trim(x) = split(x, '-')[1]

ins(t::types.Transaction) = toList(t.ins)
outs(t::types.Transaction) = toList(t.outs)
fees(t::types.Transaction) = toList(t.fees)
rates(t::types.Transaction)::Dict{String, Dict{String, types.AssetQuantity }} = t.rates == nothing ? Dict() : t.rates

date(t::types.Transaction) = t.datetime
tran_type(t::types.Transaction) = t.type
NEED FUNCTION FOR TRAN ID 

asset_id(aqi::types.AssetQtyIntegration)=aqi.asset_quantity.asset.uuid
asset_code(aqi::types.AssetQtyIntegration)=aqi.asset_quantity.asset.code
integration_id(aqi::types.AssetQtyIntegration)=uuid_trim(aqi.integration.uuid)
user_integration_id(aqi::types.AssetQtyIntegration)=uuid_trim(aqi.integration.user_integration_uuid)


asset_key(aqi::types.AssetQtyIntegration)=(asset_code(aqi), integration_id(aqi), user_integration_id(aqi))
qty(aqi::types.AssetQtyIntegration)=aqi.asset_quantity.quantity
asset_type(aqi::types.AssetQtyIntegration)=aqi.asset_quantity.asset.type
assets(aqis::Array{types.AssetQtyIntegration}) = [(asset_key(aqi), aqi.asset_quantity.asset)   for aqi in aqis]
assets(t::types.Transaction) = assets([ins(t)..., outs(t)..., fees(t)...])

assets(ts::Array{types.Transaction}) = vcat([assets(t) for t in ts])

function line_items(t::types.Transaction) 
    NEED TO ADD THE TRAN ID FOR EACH OF THE row///
    DO A FUNCTION THAT TAKES THE AQI and GENEREATES THE vcat... adds the tran_id and date... to it
    in_lt = vcat([(collect(asset_key(aqi))..., date(t), tran_type(t), qty(aqi), asset_type(aqi), false, asset_id(aqi) )   for aqi in ins(t)])
    out_lt = vcat([(collect(asset_key(aqi))..., date(t), tran_type(t), -1 * qty(aqi), asset_type(aqi),  false, asset_id(aqi) )   for aqi in outs(t)])
    fees_lt = vcat([(collect(asset_key(aqi))..., date(t), tran_type(t), -1 * qty(aqi),  asset_type(aqi), true, asset_id(aqi) )   for aqi in fees(t)])
    [in_lt..., out_lt..., fees_lt...]
end

function rate_items(t::types.Transaction, fiat_uuid=default_fiat) 
#get all fiat quotes for the coins,  rates are    coin->(fiat -> Asset-Qty)
    rs = rates(t)
    has_rates = keys(rs)
    [ (date(t), asset_id, rs[asset_id][fiat_uuid].quantity)  for  asset_id in has_rates]
end

rate_items(ts::Array{types.Transaction}, fiat_uuid=default_fiat ) = vcat([rate_items(t, fiat_uuid) for t in ts]...)

line_items(ts::Array{types.Transaction}) = vcat(filter(!x->isempty(x), map( t -> line_items(t), ts))...)
    
#    ------------------------------------- END OF ALGEBRA

## %
asset_by_id_int_uint_dict = Dict(vcat(assets(transactions)...))

df=DataFrame(line_items(transactions))
rename!(df, [:code, :int_uuid, :user_int_uuit, :date, :tran_type, :qty, :asset_type, :isfee, :uuid ])

rs = DataFrame(rate_items(transactions))
rename!(rs, [:date, :uuid, :unit_price])
#for all dates add the fiat currency as 1  
# get dates in the rs as set, then generate a fiat=1 record for the dates we have quotes
push!(rs, [[t, default_fiat, 1]  for t in Set(rs[!,:date])]...)

# instead of dates, use index to identify set of transaction. each transaction is 
# on different datetime hence gets its own index.  This make plot spacing cleaner
date_as_index = DataFrame(enumerate(sort(unique(df.date))))
rename!(date_as_index, [:date_index, :date])

df1=@chain df (
    leftjoin(rs, on=[:date, :uuid]);
    leftjoin(date_as_index, on=[:date]);
    transform([:qty, :unit_price] => ((x,y) -> x .* y) => :fair_value);
    transform(:uuid => (x -> uuid_trim.(x)) => :uuid);
    select([:code,:uuid, :qty, :isfee, :fair_value, :date, 
    :int_uuid, :user_int_uuit,:tran_type,:asset_type,:unit_price,:date_index])
)


TODO need transaction uuid to be able to group by it,
line item needs to add transaction id just like it adds the date to tgroup
## %

#Figure out out proceed for each transaction  
# filter for only positive qty,   use fair value of the line items to get the overall out-proceed, add it as column to the each line item
# also add % of the total out proceed for each line item, excluding the missing in calculation (do a function that takes
# and list of values, including missing -- can be missing/ sum  and returns either missing or ratio of value to the total)


## %
#Calculate the in proceed for each Transaction


## %
#figure out fee cost for each transaction


## % 
#from above figure out total proceed then assign it to each row as total proceed 

## %
# generate cb of the in items based on new formula


## %
# figure out how to do the inventory rules (using matrix or other recursive methods)

## %
# do impairment by doing reverse min on the prices for all the dates in the queries
# then do a comparison of the price and forward min















####################################################################################################

## %
; to see how fair value of in - fee - out  adds up
x = @chain df1 (
    groupby(:date);
    combine([:fair_value] .=> sum);   # total each date
   #select([:code, :value]);
   # groupby([:uuid, :int_uuid, :user_int_uuit]);
   # combine( [:qty] .=> sum);
   # sort(:uuid)
    )


## %
#plot value of each asset type on days   -- scatter plot   fees are shaded

shapes = [:circle,:pentagon, :rect, :diamond,  :dtriangle,   :octagon, :utriangle, :hexagon,]
  
asset_shape_dict = Dict(zip(sort(unique(df.code)), Iterators.cycle(shapes)))
asset_marker_shape(x) = asset_shape_dict[x]
expColorDict = Dict(zip(sort(unique(df.code)), Iterators.cycle(palette(:tab20))))
color_of_asset(x)=expColorDict[x]


NOTE TO GET THE DIFFERRNT LEGED I WOULD NEED TO GROUP BY ASSET then plot the asset 
this way I would get the legnds otherwise its one time series.

GROUP BY ASSET, PLot tje asset as line with markers to show the changes
THE LINES IS THE DIFFERENTIAL OF THE asset_by_id_int_uint_dict

PLOT THE CUMLULATIVE OF THE ASEETS ALSO....


PLOTING COunt of the asset
cumulative count 

value of each asset 
cumulative value of the assets
TRANSACTIONS ARE DESCRIBIBG HOW MY ASSET TIME SERIES IS CHANGING.

PLOT RATE OF EACH ASSET 


plot(df.date_index, df.value, st=:scatter, markercolor=color_of_asset.(df.code) )

##%
# figure out the inventory for the new item
# at this point df is list of assets in the in/out/fee and rates of the assets in one data frame# 
# For each line item we have the fair value of it.

# add CB column of the ins based on the fair value of out and fees. (new formula)
#first group by transaction, calculate the proceeds and % of the total fair value of the line to total in
#combine the proceeds and % so every line item has the info 
# transform the infomation to cb proceed/%of the total in


## %

#figure out realized cost basis to compare the fair value of the of the outs vs the cb of the item that
# matches it based on the rules.   
#TODO HOW TO IMPLEMENT THE INVENTORY MATCHES USING THE CHAIN?  OR FUNCTION on the dataframe?


## %
end # module